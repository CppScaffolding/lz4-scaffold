-- scaffold geniefile for lz4

lz4_script = path.getabsolute(path.getdirectory(_SCRIPT))
lz4_root = path.join(lz4_script, "lz4")

lz4_includedirs = {
	path.join(lz4_script, "config"),
	lz4_root,
}

lz4_libdirs = {}
lz4_links = {}
lz4_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { lz4_includedirs }
	end,

	_add_defines = function()
		defines { lz4_defines }
	end,

	_add_libdirs = function()
		libdirs { lz4_libdirs }
	end,

	_add_external_links = function()
		links { lz4_links }
	end,

	_add_self_links = function()
		links { "lz4" }
	end,

	_create_projects = function()

project "lz4"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		lz4_includedirs,
	}

	defines {}

	files {
		path.join(lz4_script, "config", "**.h"),
		path.join(lz4_root, "**.h"),
		path.join(lz4_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
