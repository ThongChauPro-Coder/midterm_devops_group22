# Product API + UI

This is a project organized using the MVC (Model-View-Controller) model, built with Node.js and Express, using MongoDB (Mongoose) to store product data. If the server fails to connect to MongoDB on startup (3-second timeout), the application will automatically switch to using an in-memory datastore and continue running. This project source code is provided by MSc. Mai Van Manh.

**Key Features**

- Full REST API for product management: CRUD (GET/POST/PUT/PATCH/DELETE).
- Server-side UI rendered using EJS combined with Bootstrap for product management (interface in /`).
- Each JSON response includes hostname and source information (data being retrieved from MongoDB or in-memory).
- Supports uploading product images: images are stored on disk in `public/uploads/` and the `imageUrl` field in the product stores the relative path (`/uploads/<filename>`).
- When updating or deleting a product, the old image file (located in `/uploads/`) will be deleted from disk.
- Upon startup, if the MongoDB connection is successful and the collection is empty, the application will automatically seed 10 sample Apple products into MongoDB.

**Main Structure**

- `main.js` — entrypoint: connects to MongoDB (timeout 3s), in-memory fallback, launches Express.
- `models/product.js` — Mongoose schema (`name`, `price`, `color`, `description`, `imageUrl`).
- `services/dataSource.js` — an abstraction layer between MongoDB and in-memory (seed, CRUD, file deletion when needed).
- `controllers/` — controllers that handle request/response logic.
- `routes/` — routes for API (`/products`) and UI (`/`).
- `views/` — `EJS` templates for the UI.
- `public/` — static files: CSS, JS, `uploads/` (images are stored here).

**Requirements & Configuration**

- Node.js 16+ (or compatible version) and `npm`.
- Environment file `.env`.

```text
PORT=3000
MONGO_URI=mongodb://localhost:27017/products_db
```

If you want to connect to MongoDB with a username/password, adjust the `MONGO_URI` accordingly.

**Installation & Run on Local Machine**

1. Clone this repository to your machine.

2. Install dependencies:

```bash
cd YOUR_PATH_TO_CLONED_REPO
npm install
```

3. Start the server:

```bash
# Run production (node)
npm start

# Or development mode with nodemon
npm run dev
```

4. Open your browser and go to: `http://localhost:3000/` — the UI page will display the product list and provide Add / Edit / Delete operations.

**API (JSON) — Main Endpoints**

- `GET /products` — retrieves a list of products.
- `GET /products/:id` — retrieves details of a single product.
- `POST /products` — creates a new product. Supports multipart form-data for uploading images (field file: `imageFile`) and text fields: `name`, `price`, `color`, `description`.
- `PUT /products/:id` — replaces the entire product. Supports uploading files in multiple parts.
- `PATCH /products/:id` — updates a part. Supports uploading files in multiple parts.
- `DELETE /products/:id` — deletes the product and the corresponding image file if the image is stored in `/uploads/`.

Example of creating a product (curl, upload file):

```bash
curl -X POST -F "name=My Device" -F "price=199" -F "color=black" -F "description=Note" -F "imageFile=@/path/to/photo.jpg" http://localhost:3000/products
```

Note: The UI on the homepage uses fetch + FormData to send files, so you don't need to change anything if you're using the interface.