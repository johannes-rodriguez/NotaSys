package model;
import java.util.List;
import java.util.Map;
import model.AppModel.*;
/** Persistence boundary. A failed save must leave the durable data unchanged. */
public interface DataRepository {
    record Snapshot(Map<String, List<Master>> masters, List<Document> documents, List<Note> notes, List<Audit> audits) {
        public Snapshot {
            masters = masters.entrySet().stream().collect(java.util.stream.Collectors.toUnmodifiableMap( Map.Entry::getKey, entry -> List.copyOf(entry.getValue())));
            documents = List.copyOf(documents);
            notes = List.copyOf(notes);
            audits = List.copyOf(audits);
        }
    }
    Snapshot load();
    void save(Snapshot before, Snapshot after);
}
