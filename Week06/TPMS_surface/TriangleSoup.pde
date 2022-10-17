import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class TriangleSoup {  
  List<Triangle> triangles = new ArrayList<Triangle>();
  float scale = 1;

  void scale( float scale ) {
    this.scale = scale;
  }

  void add( PVector a, PVector b, PVector c, PVector n ) {
    triangles.add(new Triangle( a, b, c, n ));
  }

  void save( String filename ) {
    try {
      byte[] header = new byte[80];
      byte[] count = new byte[4];
      byte[] tri = new byte[50];

      FileOutputStream out = new FileOutputStream( filename );  
      ByteBuffer buffer = ByteBuffer.allocate( 80 );
      buffer.order( ByteOrder.LITTLE_ENDIAN );

      Arrays.fill(header, 0, 80, (byte)0);
      out.write( header, 0, 80 );
      buffer.putInt( triangles.size());
      buffer.rewind();
      buffer.get( count, 0, 4 );
      out.write( count, 0, 4 ); 


      for ( int i=0; i<triangles.size(); i++) {
        buffer.rewind();
        buffer.putFloat( triangles.get(i).n.x * scale);
        buffer.putFloat( triangles.get(i).n.z * scale);
        buffer.putFloat( triangles.get(i).n.y * scale);

        buffer.putFloat( triangles.get(i).a.x * scale);
        buffer.putFloat( triangles.get(i).a.z * scale);
        buffer.putFloat( triangles.get(i).a.y * scale);

        buffer.putFloat( triangles.get(i).b.x * scale);
        buffer.putFloat( triangles.get(i).b.z * scale);
        buffer.putFloat( triangles.get(i).b.y * scale);

        buffer.putFloat( triangles.get(i).c.x * scale);      
        buffer.putFloat( triangles.get(i).c.z * scale);
        buffer.putFloat( triangles.get(i).c.y * scale); 

        buffer.putShort( (short)0 );
        buffer.rewind();
        buffer.get( tri, 0, 50 );
        out.write( tri, 0, 50 );
      }

      out.flush();
      out.close();
    } 
    catch ( IOException ioe ) {
      ioe.printStackTrace();
    }
  }
}
