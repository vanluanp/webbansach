package tools;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexMatches {
    public static boolean regexMatches(String regex, String input) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }
}
