import { createHash } from "node:crypto";
import { readFileSync, writeFileSync } from "node:fs";

const [formula, version] = process.argv.slice(2);
if (!formula || !version) {
  console.error("Usage: update-formula.ts <formula> <version>");
  process.exit(1);
}

// Read current formula and extract existing url
const formulaPath = `Formula/${formula}.rb`;
let content = readFileSync(formulaPath, "utf-8");
const urlMatch = content.match(/url "(.*?)"/);
if (!urlMatch) {
  console.error(`Could not find url in ${formulaPath}`);
  process.exit(1);
}

// Derive new url by replacing the version segment in the existing one
const oldUrl = urlMatch[1];
const oldVersion = oldUrl.match(/(\d+\.\d+\.\d+)/)?.[1];
if (!oldVersion) {
  console.error(`Could not extract version from url: ${oldUrl}`);
  process.exit(1);
}
const newUrl = oldUrl.replaceAll(oldVersion, version);

// Download tarball and compute SHA256
const response = await fetch(newUrl);
if (!response.ok) {
  console.error(`Failed to fetch ${newUrl}: ${response.status}`);
  process.exit(1);
}
const buffer = new Uint8Array(await response.arrayBuffer());
const sha256 = createHash("sha256").update(buffer).digest("hex");

// Update formula file
content = content.replace(/url ".*"/, `url "${newUrl}"`);
content = content.replace(/sha256 ".*"/, `sha256 "${sha256}"`);
writeFileSync(formulaPath, content);

console.log(`Updated ${formulaPath} to ${version} (sha256: ${sha256})`);
