locals {
    global_shutter = yamldecode(file("${path.cwd}/../../shuttering/sandbox/global-shutter.yml")).global_shutter
}