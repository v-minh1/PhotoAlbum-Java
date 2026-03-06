# Architecture Diagram

This diagram illustrates the high-level architecture of the Photo Album application, a Spring Boot web application for photo storage and gallery management backed by an Oracle database.

## Application Architecture

```mermaid
flowchart TD
    Browser["Browser\nWeb Client"]

    subgraph App["Photo Album Application (Spring Boot 2.7.18, Java 8, Port 8080)"]
        subgraph Presentation["Presentation Layer"]
            HC["HomeController\nGallery View"]
            DC["DetailController\nPhoto Detail View"]
            PFC["PhotoFileController\nUpload / Download / Delete"]
            TH["Thymeleaf Templates\nHTML Views"]
        end

        subgraph Business["Business Logic Layer"]
            PS["PhotoService\nPhoto Management"]
        end

        subgraph Data["Data Access Layer"]
            PR["PhotoRepository\nSpring Data JPA"]
        end

        subgraph Model["Domain Model"]
            PM["Photo Entity\nid, filename, contentType, data"]
            UR["UploadResult\nResponse DTO"]
        end
    end

    subgraph Storage["Data Storage"]
        ODB[("Oracle Database\nFREEPDB1 (port 1521)\nPhoto metadata and binary data")]
    end

    subgraph Runtime["Container Runtime"]
        DK["Docker Compose\nApp + Oracle DB containers"]
    end

    Browser -- "HTTP requests (port 8080)" --> HC
    Browser -- "HTTP requests (port 8080)" --> DC
    Browser -- "Multipart upload (max 10MB)" --> PFC

    HC --> TH
    DC --> TH
    PFC --> TH

    HC --> PS
    DC --> PS
    PFC --> PS

    PS --> PR
    PS --> PM
    PS --> UR

    PR -- "JPA / Hibernate OracleDialect" --> ODB

    DK -. "Hosts" .-> App
    DK -. "Hosts" .-> Storage
```
