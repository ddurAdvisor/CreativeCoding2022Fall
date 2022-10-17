void export() {
  selectOutput( "Export to STL", "exportCallback" );
}

void exportCallback(File exportFile) {
  if ( exportFile != null ) {
    String filename = exportFile.getAbsolutePath();
    TriangleSoup export = new TriangleSoup();
    export.scale(scaleIndex);
    exportDesign(export);
    export.save(filename);
  }
}

void exportDesign(TriangleSoup export) {
  exportMain(export);
}

void exportMain(TriangleSoup export) {
  for (Triangle t : stlTriangles) {
    export.add(t.a, t.b, t.c, t.n);
  }
}
