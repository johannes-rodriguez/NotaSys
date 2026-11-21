package model;
import model.AppModel.*;
/** Reports are independent of the GUI and of catalog persistence. */
public interface ReportProvider {
    ReportData query(String company, ReportSpec report, Filter filter);
    default ReportData page(String company, ReportSpec report, Filter filter, int offset, int limit) {
        ReportData full = query(company, report, filter);
        int start = Math.min(offset, full.rows().size());
        return new ReportData(full.columns(), full.rows().subList(start,Math.min(start+limit,full.rows().size())),full.rows().size(),true);
    }
}
