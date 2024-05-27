# MongoDB Seeder Docker Image

This Docker image seeds MongoDB databases with JSON data from user-specified files.

## Features

- **Dynamic Database Creation**: Seeds multiple databases as specified by the user.
- **Automatic Collection Creation**: Creates collections based on JSON filenames.

## Configuration

- **`MONGODB_URI`**: MongoDB connection URI.
- **`DB_NAMES`**: Comma-separated list of database names.

## Usage

### Using Docker Run

1. **Pull the Docker image:**

   ```sh
   docker pull hoomanmaia/mongo-seeder
   ```

2. **Run the container:**
   ```sh
   docker run --rm -e "MONGODB_URI=your-mongodb-uri" -e "DB_NAMES=your-database-names" -v /path/to/your/db:/mongo-seeder/db hoomanmaia/mongo-seeder
   ```

### Using Docker Compose

1. **Create `docker-compose.yml` file:**

   ```yaml
   services:
     mongo-seeder:
       image: hoomanmaia/mongo-seeder
       environment:
         - MONGODB_URI=your-mongodb-uri
         - DB_NAMES=your-database-names
       volumes:
         - ./path/to/your/db:/mongo-seeder/db
   ```

2. **Run Docker Compose:**
   ```sh
   docker-compose up
   ```

## Example

### Using Docker Run

```sh
docker run --rm -e "MONGODB_URI=mongodb+srv://username:password@cluster0.mongodb.net" -e "DB_NAMES=db1,db2" -v /path/to/your/db:/mongo-seeder/db hoomanmaia/mongo-seeder
```

### Using Docker Compose

1. **Example `docker-compose.yml` file:**

   ```yaml
   services:
     mongo-seeder:
       image: hoomanmaia/mongo-seeder
       environment:
         - MONGODB_URI=mongodb+srv://username:password@cluster0.mongodb.net
         - DB_NAMES=db1,db2
       volumes:
         - ./path/to/your/db:/mongo-seeder/db
   ```

2. **Run Docker Compose:**
   ```sh
   docker-compose up
   ```
