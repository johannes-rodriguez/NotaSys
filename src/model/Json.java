package model;
import java.lang.reflect.RecordComponent;
import java.util.*;
import java.util.stream.Collectors;
/** Small JSON writer for immutable command records. No parser or ORM dependency. */
public final class Json {
    private Json() {
    }
    public static String encode(Object value) {
        if (value == null) return "null";
        if (value instanceof Number || value instanceof Boolean) return value.toString();
        if (value instanceof Collection<?> items) return items.stream().map(Json::encode).collect(Collectors.joining(",", "[", "]"));
        if (value.getClass().isRecord()) {
            List<String> fields = new ArrayList<>();
            try {
                for (RecordComponent field : value.getClass().getRecordComponents()) fields.add(encode(field.getName()) + ":" + encode(field.getAccessor().invoke(value)));
            }
            catch (ReflectiveOperationException ex) {
                throw new IllegalArgumentException("No se pudo preparar la operación.", ex);
            }
            return String.join(",", fields).transform(text -> "{" + text + "}");
        }
        StringBuilder result = new StringBuilder("\"");
        for (char ch : value.toString().toCharArray()) {
            switch (ch) {
                case '"' -> result.append("\\\"");
                case '\\' -> result.append("\\\\");
                case '\n' -> result.append("\\n");
                case '\r' -> result.append("\\r");
                case '\t' -> result.append("\\t");
                default -> {
                    if (ch < 32) result.append(String.format("\\u%04x", (int) ch));
                    else result.append(ch);
                }
            }
        }
        return result.append('"').toString();
    }
}
