public class ParkLocator {
    public static String[] country(String x) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(x);
    }
}