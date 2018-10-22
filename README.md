# App Engine Flexible Docker Runtime with Swift and Vapor
Swift Vapor Todo CRUD API using MySQL to store data. It Provides app engine app.yaml configuration file and Dockerfile to deploy the app to Google App Engine Flexible Custom Runtime.

## API Specification
- list of todos (GET /todo/)
- list of single todos (GET /todo/id)
- create todo (POST /todo) -> JSON { title: String, content: String, dueDate: ISO8601 Formatted String}
- update todo (PUT /todo) -> JSON { id: number, title: String, content: String, dueDate: ISO8601 Formatted String}


## Try it out Locally
1. Clone the app to your local machine
2. Install MySQL locally
3. Set Environment Variable for MySQL located in routes.swift in your local environment
4. Build and Run the app locally
5. Test CRUD using CURL

## Deploying to App Engine

1. Clone the app to your local machine.
2. Install Google Cloud SDK and authenticate in your local machine using your Google Cloud Account.
3. Create Cloud SQL instance in Google Cloud Console. Create user, password, and new database called todo. Set public IP Access to 0.0.0.0/0 (Warning:  Currently Vapor 3 does not support connecting to MySQL using Unix Socket for Cloud SQL Proxy and SSL Client Certificate configuration. For testing purpose we just use this method until vapor officially supports it).
4. Open app.yaml and update the environment variable for MySQL username, ip address, password, database, and cloud sql instance name
5. type gcloud app deploy to deploy.
6. type gcloud app browse to view the app address
6. Make sure to disable the application from the App Engine Console  and stop the Cloud SQL instance to avoid billing when testing.
