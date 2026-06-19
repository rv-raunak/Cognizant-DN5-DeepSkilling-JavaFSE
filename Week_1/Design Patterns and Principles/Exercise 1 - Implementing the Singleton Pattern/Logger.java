public class Logger {
    private static Logger instance;

    // made this private so that we can't use 'new' outside this class
    private Logger() {
    }

    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    public void log(String message) {
        System.out.println("System Log: " + message);
    }
}