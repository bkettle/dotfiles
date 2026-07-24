--[[
BENKETTLE.XYZ WEBSITE EXPORT

INSTALLATION
* copy this file in $CONFIGDIR/lua/ where CONFIGDIR
is your darktable configuration directory
* add the following line in the file $CONFIGDIR/luarc
  require "website-export"

USAGE
* select "Export to benkettle.xyz" in the storage selection menu
* set the website photos content directory
* export your images
]]
darktable = require "darktable"
darktable.configuration.check_version(...,{2,0,0})

local SITE_DIR = "/home/ben/dev/personal-website"
local JUSTFILE = SITE_DIR .. "/justfile"

local function export_image(storage, image, format, filename, number, total, high_quality, extra_data)
    -- filename is the absolute temp export path darktable wrote the image to.
    local cmd = string.format(
        "just -f %q photo-from-file %q 2>&1",
        JUSTFILE, filename
    )

    local base = filename:match("([^/]+)$")
    dt.print("Creating photo post for " .. base .. "...")

    local result = dt.control.execute(cmd)

    if result ~= 0 then
        dt.print_error("photo-from-file failed for " .. base .. " (exit code " .. result .. ")")
        dt.print("ERROR: photo-from-file failed for " .. base .. " — check the darktable log")
    else
        dt.print("Photo post created for " .. base)
    end
end

local function finalize(storage, image_table, extra_data)
    dt.print("Done. Open " .. SITE_DIR .. "/content/photos/ to review drafts.")
end

local scp_path = darktable.new_widget("entry"){
  tooltip ="Path to the photos directory to export to",
  text = "",
  reset_callback = function(self) self.text = "" end
}

darktable.register_storage("website_export","Export to benkettle.xyz", export_image, finalize })
