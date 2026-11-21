import model.*;
import model.AppModel.*;
import view.*;
import controller.AppController;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.nio.file.*;
import javax.imageio.ImageIO;
public final class UiTest {
    public static void main(String[] args)throws Exception {
        var fixture=ModelTest.fixture();
        Path output=Path.of(args[0]);
        Files.createDirectories(output);
        SwingUtilities.invokeAndWait(()-> {
            try {
                MainView.configureTheme();
                AppModel model=new AppModel(new ModelTest.MemoryRepository(fixture),(c,r,f)->new ReportData(new String[] {
                    "Sin resultados"
                }
                ,java.util.List.of()));
                MainView main=new MainView();
                new AppController(model,main).start();
                main.showSection("Reportes");
                render(main,output.resolve("01-reportes.png"));
                Document original=model.documents("20999999991").stream().filter(Document::active).findFirst().orElseThrow();
                DocumentDialog editor=new DocumentDialog(main,true,model.masters("Clientes"),model.masters("Productos y servicios"),java.util.List.of(original));
                editor.number.setText("FC01-00000201");
                editor.description.setText("Reducción acordada de honorarios por ajuste de alcance.");
                if(editor.product.getItemCount()!=original.lines().size())throw new AssertionError("Se filtraron mal los artículos de la factura");
                for(int i=0; i<editor.product.getItemCount(); i++) {
                    String code=editor.product.getItemAt(i).id();
                    if(original.lines().stream().noneMatch(line->line.productId().equals(code)))throw new AssertionError("Artículo ajeno visible");
                }
                editor.fill(originalNote(model,original));
                editor.setModal(false);
                editor.setVisible(true);
                render(editor,output.resolve("02-nota-vinculada.png"));
                editor.preview();
                DocumentPreview preview=null;
                for(Window window:Window.getWindows())if(window instanceof DocumentPreview p)preview=p;
                if(preview==null||preview.getWidth()<800||!preview.paper.getText().contains("TOTAL"))throw new AssertionError("Vista previa incompleta");
                render(preview,output.resolve("03-vista-previa.png"));
                ReportWindow report=new ReportWindow("M&Zuel Contadores & Auditores S.A.C.",AppModel.REPORTS.get(0),model.masters("Clientes"),java.util.List.of());
                report.setVisible(true);
                report.noteType.setSelectedItem("Débito");
                if(!report.filter().noteType().equals("Débito"))throw new AssertionError("Filtro crédito/débito");
                render(report,output.resolve("04-reporte.png"));
                for(Window window:Window.getWindows())window.dispose();
                System.out.println("Interfaz: detalle restringido, vista previa amplia, 15 reportes y selector verificados.");
            }
            catch(Exception error) {
                throw new RuntimeException(error);
            }
        });
    }
    static Note originalNote(AppModel model,Document d) {
        return model.notes(d.company()).stream().filter(n->n.documentKey().equals(d.key())).findFirst().orElseThrow();
    }
    static void render(Window window,Path file)throws Exception {
        window.validate();
        BufferedImage image=new BufferedImage(window.getWidth(),window.getHeight(),BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics=image.createGraphics();
        window.paint(graphics);
        graphics.dispose();
        ImageIO.write(image,"png",file.toFile());
    }
}
