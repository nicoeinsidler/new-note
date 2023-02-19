import std/[times]
import mustache, tables

# const config_dir = "~/.config/new-note/"

# var document: string = readFile(config_dir & "template.mustache")

var document: string = readFile("./template.mustache")

let now_datetime: DateTime = now()
let now_string_rfc3339 = now_datetime.format("yyyy-MM-dd'T'HH:mm:sszzz")
let now_string_human = now_datetime.format("dddd', 'dd-MMM-yy' 'HH:mm:ss' UTC'z")

var c : Context = newContext()
c["title"] = "Test Dokument"
c["datetime"] = now_string_human
c["meta"] = {
    "type": "meeting",
    "author": "Nico",
    "timestamp": now_string_rfc3339
    }.toTable


echo render(document, c)