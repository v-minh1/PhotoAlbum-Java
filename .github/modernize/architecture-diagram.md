# Architecture Diagram

This diagram illustrates the current architecture of the Photo Album application, a Spring Boot web application that stores photos as binary data in an Oracle database.

## Application Architecture

```mermaid
flowchart TD
    Browser["Web Browser\nHTML / JavaScript"]

    subgraph App["Spring Boot Application (Java 8, Spring Boot 2.7)"]
        subgraph Presentation["Presentation Layer"]
            HC["HomeController\nGallery view & multi-file upload"]
            DC["DetailController\nSingle photo view & delete"]
            PFC["PhotoFileController\nServe photo binary data"]
            TH["Thymeleaf Templates\nindex.html / detail.html"]
        end

        subgraph Business["Business Logic Layer"]
            PS["PhotoService\nUpload validation, image dimension extraction"]
        end

        subgraph DataAccess["Data Access Layer"]
            PR["PhotoRepository\nSpring Data JPA"]
            JPA["Hibernate ORM\nOracle Dialect"]
        end
    end

    subgraph Storage["Data Storage"]
        ORA[("Oracle Database\nPhotos table\nBLOB photo data")]
    end

    Browser -->|"HTTP GET / POST"| HC
    Browser -->|"HTTP GET /detail"| DC
    Browser -->|"HTTP GET /photo-file"| PFC
    HC --> TH
    DC --> TH
    HC --> PS
    DC --> PS
    PFC --> PS
    PS --> PR
    PR --> JPA
    JPA -->|"JDBC ojdbc8\nport 1521"| ORA
```
