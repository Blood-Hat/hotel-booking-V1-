# Let's Go — Hotel and Resort Booking

A Java web application for browsing hotels and resorts, reserving rooms, and managing bookings. Customers can explore destinations, choose a room type, and review their booking history. Administrators can manage property listings and reservations.

Built as an academic project with JSP, JDBC, Oracle, and Apache Tomcat.

## Features

- Customer registration, login, and logout using HTTP sessions.
- Hotel and resort listings filtered by destination or property type.
- Property details with Single, Double, and Deluxe room rates.
- Booking with guest details, room quantity, and check-in/check-out dates.
- Server-side date validation and availability checks against overlapping reservations.
- Total cost calculated from the nightly rate, room quantity, and length of stay.
- Booking confirmation and history for the signed-in customer.
- Contact form with messages saved to the database.
- Admin pages for adding, viewing, updating, and deleting property listings and managing bookings.
- Sample property data for Indian and international destinations.

## Technology

| Layer | Tools |
| --- | --- |
| Pages and styling | JSP, HTML, CSS, JavaScript, Bootstrap, jQuery |
| Application logic | Java, JSP scriptlets, JDBC |
| Database | Oracle XE |
| Server | Apache Tomcat 10.1 |
| Project tooling | Eclipse Dynamic Web Project |

The checked-in Eclipse configuration targets **Java 25** and **Dynamic Web Module 6.0**. The project uses Eclipse's web project structure; it does not include a Maven or Gradle build.

## Project structure

```text
HotelBooking/
├── src/com/hotelbooking/util/
│   ├── Database.java         # Shared Oracle connection helper
│   └── Html.java             # HTML escaping helper
├── WebContent/
│   ├── index.jsp             # Home page
│   ├── register.jsp          # Customer registration and login
│   ├── place.jsp             # Filtered property listings
│   ├── hotel.jsp             # Property details and booking form
│   ├── bookroom.jsp          # Booking validation and persistence
│   ├── booking-success.jsp   # Booking confirmation
│   ├── bookings.jsp          # Customer booking history
│   ├── contact.jsp           # Contact form
│   ├── admin/                # Admin login and management pages
│   ├── bootstrap/            # Bootstrap assets
│   ├── themes/               # Styles, scripts, and images
│   └── WEB-INF/              # Web configuration and library JARs
└── database/
    ├── setup.sql             # Schema, demo admin, and initial properties
    └── seed_featured.sql     # Additional sample properties
```

## Run locally

### 1. Prepare the tools

Install JDK 25, Eclipse IDE for Enterprise Java and Web Developers, Apache Tomcat 10.1, and Oracle XE with SQL*Plus. If using a different JDK, adjust the project's Java compiler, build path, and facet settings together.

### 2. Initialize Oracle

From the project root, open SQL*Plus as an Oracle administrator:

```text
sqlplus / as sysdba
@database/setup.sql
```

The script creates the `hotelbooking` schema, tables, booking ID sequence, a demo admin account, and sample property records. It also runs `seed_featured.sql` automatically.

| Connection setting | Default |
| --- | --- |
| JDBC URL | `jdbc:oracle:thin:@localhost:1521:XE` |
| Schema user | `hotelbooking` |
| Schema password | `hotelbooking` |

These are local demo credentials. The setup script resets this schema user's password when rerun; use a dedicated demo database. Existing tables can produce object-already-exists messages because the script continues through SQL errors. Check the output when initializing it.

If your Oracle connection differs, update `src/com/hotelbooking/util/Database.java` and the legacy JSP pages that open their own connections. Search for `jdbc:oracle:thin:` to find them. Changing only the shared helper does not update every page.

### 3. Import into Eclipse

1. Choose **File → Import → General → Existing Projects into Workspace**.
2. Select the cloned project folder and import `Project_HotelBooking`.
3. Under **Project → Properties → Java Build Path**, select JDK 25.
4. Under **Targeted Runtimes**, select or configure Apache Tomcat 10.1.
5. Confirm that `WebContent/WEB-INF/lib` contains an Oracle JDBC driver. The project currently includes the legacy `classes12.jar`; driver compatibility should be checked if you change the database or JDK.
6. Refresh the project and choose **Project → Clean** to rebuild it.

### 4. Start Tomcat

1. Open Eclipse's **Servers** view and create a Tomcat 10.1 server if needed.
2. Set its HTTP port to **9999**, or another free port. The original local setup uses 9999 to avoid a conflict with Oracle XE on 8080.
3. Use **Add and Remove** to add `Project_HotelBooking` to the server.
4. Start the server and open:

```text
http://localhost:9999/Project_HotelBooking/
```

If you choose another HTTP port, replace `9999` in the URL.

## Try the application

1. Register a customer account from the registration/login page.
2. Browse a destination or open the resort listings.
3. Select a property, choose a room type, and enter guest details and future stay dates.
4. Submit the booking and review its confirmation.
5. Open **My Bookings** to see the saved reservation.

For the admin demo, open `/Project_HotelBooking/admin/adminlogin.jsp` on the same server and sign in with user ID `admin` and password `admin123`. This account is created by the setup script.

## Database tables

| Table | Purpose |
| --- | --- |
| `ohbhotels` | Properties, room inventory, and nightly prices |
| `ohbusers` | Customer accounts |
| `ohbadmin` | Admin accounts |
| `ohbroombook` | Reservations and calculated totals |
| `ohbblog` | Contact form submissions |

## Troubleshooting

- **Oracle driver not found:** check that the JDBC JAR is present in `WebContent/WEB-INF/lib` and deployed with the application.
- **Oracle connection or login error:** confirm the listener, service name, schema credentials, and connection settings in both the Java helper and legacy JSPs.
- **Application returns 404:** check that the project was added to Tomcat and that the context path is `Project_HotelBooking`.
- **Java runtime or compiler errors:** align Eclipse's installed JRE, project build path, Java facet, and Tomcat runtime with the configured JDK.
- **Empty property listings:** review the database setup output and confirm that the seed records were inserted.

## Current limitations

This is a local learning and demonstration project. Account passwords are stored in plain text, database credentials are embedded in the source, and some legacy admin queries concatenate request values into SQL. Authentication, authorization, query handling, and password storage need further work before a public deployment.

Bookings are saved directly without a payment gateway. The legacy payment page redirects to booking confirmation or history. Availability checks do not lock inventory across simultaneous bookings, so they do not guarantee protection against concurrent overbooking.

## Possible improvements

- Move request handling and database operations into servlets and a dedicated data access layer.
- Hash account passwords and move database configuration out of source code.
- Apply consistent admin authorization, parameterized queries, and CSRF protection.
- Add transaction-safe inventory handling for simultaneous reservations.
- Add automated tests, a reproducible build, and a real payment integration.
