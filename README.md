# E-Service Web Application

A Java EE web application built with JSP and Servlets, designed to run on Apache Tomcat.

## Prerequisites

Before running the project, make sure you have the following installed on your macOS system:

1. **Java Development Kit (JDK 8 or higher)**
2. **Apache Tomcat 9** (Can be installed via Homebrew or downloaded directly)
3. **MySQL Server** (For the database)
4. **Visual Studio Code (VS Code)**

### Required VS Code Extensions
To smoothly develop and run this Java EE project in VS Code, install the following extensions:
- **Extension Pack for Java** (`vscjava.vscode-java-pack`)
- **Community Server Connectors** (`redhat.vscode-community-server-connectors`) - *Crucial for Tomcat integration*
- **Database Client** (Optional, to manage MySQL within VS Code)

---

## 1. Database Setup

The project requires a MySQL database. A database script `eservice.sql` is included in the project root to set up the schema and seed data.

### Via Terminal
1. Open your terminal and log in to MySQL:
   ```bash
   mysql -u root -p
   ```
2. Create the database:
   ```sql
   CREATE DATABASE e_service;
   ```
3. Exit MySQL and import the provided SQL file:
   ```bash
   mysql -u root -p e_service < eservice.sql
   ```

*(Alternatively, you can use MySQL Workbench, DBeaver, or a VS Code Database extension to create the `e_service` database and execute the `eservice.sql` script.)*

---

## 2. Preparing the Application in VS Code

1. Open VS Code.
2. Go to **File > Open Folder...** and select the `e_service` folder (`/Users/truptighugase/Documents/e_service`).
3. Since this is an Apache Ant project (indicated by `build.xml`), VS Code's Java extension will recognize it. Allow the Java Language Server a moment to index the workspace.

---

## 3. How to Run the Project in VS Code

There are two main ways to run this project in VS Code: via the **Server Connectors Extension** (Recommended for development) or via **Terminal Commands**.

### Method A: Using the Community Server Connectors Extension (Recommended)

This method lets you start Tomcat and deploy the application without leaving the VS Code UI.

1. **Add Tomcat Server:**
   - In the VS Code Activity Bar (left side), click on the **Servers** view (provided by the Community Server Connectors extension).
   - Click the `+` (Create new server) icon.
   - Select **Tomcat 9.x**.
   - Browse to your Tomcat installation directory. (If installed via Homebrew, it's typically `/opt/homebrew/Cellar/tomcat@9/<version>/libexec` or `/usr/local/opt/tomcat@9/libexec`).

2. **Build the Project:**
   - Open a terminal in VS Code (`Ctrl + ~` or `Cmd + j`).
   - Run the Ant build command to compile and package the app into a `.war` file:
     ```bash
     ant clean build
     ```
   - This creates a `dist/e_service.war` file.

3. **Deploy the Application:**
   - In the **Servers** view, right-click your Tomcat server and select **Add Deployment**.
   - Choose **File...** and select `dist/e_service.war` from your workspace.

4. **Start the Server:**
   - Right-click the Tomcat server and select **Start Server**.
   - The application will deploy automatically.
   - Right-click the deployment (`e_service.war`) under the server and select **Open in Browser**.

### Method B: Using Terminal Commands (Homebrew)

If your Tomcat is installed as a Homebrew service, you can deploy and run it entirely via the VS Code integrated terminal.

1. **Build the WAR file:**
   ```bash
   ant clean build
   ```

2. **Deploy the WAR file to Tomcat:**
   Copy the built web application archive to Tomcat's `webapps` folder. Adjust the Tomcat version path accordingly if needed:
   ```bash
   cp dist/e_service.war /opt/homebrew/opt/tomcat@9/libexec/webapps/
   ```

3. **Start Tomcat:**
   ```bash
   brew services start tomcat@9
   ```
   *(To stop it later: `brew services stop tomcat@9`)*

---

## 4. Accessing the Application

Once Tomcat is running and the application is deployed, open your web browser and navigate to:

**🌐 http://localhost:8080/e_service/**

### Useful Application URLs:

| Page | Local URL |
|------|-----------|
| **Home Page** | http://localhost:8080/e_service/ |
| **User Login** | http://localhost:8080/e_service/login.jsp |
| **User Registration** | http://localhost:8080/e_service/user-reg.jsp |
| **Service Registration** | http://localhost:8080/e_service/service-reg.jsp |
| **Tomcat Manager** | http://localhost:8080/manager |

---

## Project Structure Overview

```text
e_service/
├── src/            # Java source code (Servlets, utilities, models)
├── web/            # Web application directory (JSP pages, CSS, JS, images)
│   ├── WEB-INF/    # Web deployment descriptor (web.xml) and lib
│   ├── assets/     # Static assets (images, etc.)
│   ├── css/        # Cascading Style Sheets
│   └── js/         # JavaScript files
├── lib/            # External JAR library dependencies
├── dist/           # Built application WAR file (`e_service.war`) goes here
├── build/          # Compiled `.class` files generated during build
├── eservice.sql    # Database schema and initial data
└── build.xml       # Apache Ant build configuration script
```
# eservice-finding-system
# eservice-finding-system
# eservice-finding-system


git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/TruptiG0909/eservice-finding-system.git
git push -u origin main
# eservice-finding-system
