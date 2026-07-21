import mysql from "mysql2/promise";
import { env } from "../src/lib/env";
import * as fs from "fs";
import * as path from "path";

async function runMigrations() {
  const connection = await mysql.createConnection({
    host: env.dbHost,
    port: env.dbPort,
    user: env.dbUser,
    password: env.dbPassword,
    database: env.dbName,
  });

  try {
    console.log("Running database migrations...");

    // Read schema file
    const schemaPath = path.join(process.cwd(), "database", "schema.sql");
    const schema = fs.readFileSync(schemaPath, "utf-8");

    // Split by semicolons and execute each statement
    const statements = schema
      .split(";")
      .map((stmt) => stmt.trim())
      .filter((stmt) => stmt.length > 0);

    for (const statement of statements) {
      try {
        console.log(`Executing: ${statement.substring(0, 80)}...`);
        await connection.execute(statement);
      } catch (err) {
        if (err && typeof err === "object" && "code" in err) {
          const error = err as { code?: string; message?: string };
          // Ignore "table already exists" errors
          if (error.code === "ER_TABLE_EXISTS_ERROR") {
            console.log(`✓ Table already exists (skipped)`);
          } else {
            console.error(`✗ Error: ${error.message ?? "Unknown error"}`);
          }
        } else {
          console.error(`✗ Error: ${err}`);
        }
      }
    }

    console.log("✓ Migration completed!");
    process.exit(0);
  } catch (err) {
    console.error("Migration failed:", err);
    process.exit(1);
  } finally {
    await connection.end();
  }
}

runMigrations();
