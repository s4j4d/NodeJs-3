/*
  Warnings:

  - You are about to drop the column `department` on the `DoneWork` table. All the data in the column will be lost.
  - You are about to drop the column `month` on the `Department` table. All the data in the column will be lost.
  - Added the required column `departmentId` to the `DoneWork` table without a default value. This is not possible if the table is not empty.
  - Added the required column `month` to the `DoneWork` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_DoneWork" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "departmentId" INTEGER NOT NULL,
    "hours" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "month" TEXT NOT NULL,
    CONSTRAINT "DoneWork_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "DoneWork_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_DoneWork" ("employeeId", "hours", "id") SELECT "employeeId", "hours", "id" FROM "DoneWork";
DROP TABLE "DoneWork";
ALTER TABLE "new_DoneWork" RENAME TO "DoneWork";
CREATE TABLE "new_Department" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "requiredHours" INTEGER NOT NULL,
    "rewards" INTEGER,
    "parentId" INTEGER,
    CONSTRAINT "Department_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Department" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Department" ("id", "parentId", "requiredHours", "rewards") SELECT "id", "parentId", "requiredHours", "rewards" FROM "Department";
DROP TABLE "Department";
ALTER TABLE "new_Department" RENAME TO "Department";
CREATE UNIQUE INDEX "Department_name_key" ON "Department"("name");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
