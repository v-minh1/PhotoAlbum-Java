# Architecture Diagram

A Spring Boot 2.7 photo gallery application using Thymeleaf for server-side rendering, Spring Data JPA for data access, and Oracle Database for persistent storage of photo metadata and binary image data.

## Application Architecture

```mermaid
flowchart TD
    Browser["Browser\nUser Interface"]

    subgraph Presentation["Presentation Layer (Thymeleaf + CSS/JS)"]
        IndexTemplate["index.html\nPhoto Gallery View"]
        DetailTemplate["detail.html\nPhoto Detail View"]
        LayoutTemplate["layout.html\nBase Layout"]
        StaticAssets["Static Assets\nCSS / JavaScript"]
    end

    subgraph Controllers["Controller Layer (Spring MVC)"]
        HomeCtrl["HomeController\nGallery and upload handling"]
        DetailCtrl["DetailController\nPhoto detail and navigation"]
        FileCtrl["PhotoFileController\nServe photo binary data"]
    end

    subgraph Services["Service Layer"]
        PhotoSvc["PhotoService\nUpload, retrieve, delete, navigate"]
    end

    subgraph DataAccess["Data Access Layer (Spring Data JPA / Hibernate)"]
        PhotoRepo["PhotoRepository\nCRUD and custom queries"]
        PhotoModel["Photo Entity\nMetadata and BLOB data"]
    end

    subgraph DataStorage["Data Storage"]
        OracleDB[("Oracle Database\nPhoto metadata and image BLOBs")]
    end

    subgraph Infrastructure["Infrastructure"]
        Docker["Docker / Docker Compose\nApp container and Oracle DB container"]
    end

    Browser -- "HTTP GET/POST" --> Controllers
    Presentation -- "rendered by" --> Controllers
    HomeCtrl --> PhotoSvc
    DetailCtrl --> PhotoSvc
    FileCtrl --> PhotoSvc
    PhotoSvc --> PhotoRepo
    PhotoRepo --> PhotoModel
    PhotoModel -- "JPA/Hibernate" --> OracleDB
    Docker -- "hosts" --> Controllers
    Docker -- "hosts" --> OracleDB
```
