a:81:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"1.参考网址：";}i:2;i:1;}i:3;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:77:"http://www.learnopengles.com/android-lesson-four-introducing-basic-texturing/";i:1;N;}i:2;i:18;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:95;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:95;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:"2.添加纹理到着色器中：";}i:2;i:97;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:129;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:129;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"（1）定点着色器(Vertex Shader)中需要添加如下代码：";}i:2;i:131;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:204;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:259:"
attribute vec2 a_TexCoordinate; // Per-vertex texture coordinate information we will pass in.
...
varying vec2 v_TexCoordinate;   // This will be passed into the fragment shader.
...
// Pass through the texture coordinate.
v_TexCoordinate = a_TexCoordinate;
";i:1;s:4:"java";i:2;N;}i:2;i:204;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:204;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"(2)片元着色器(Fragment Shader)中需要添加如下代码：";}i:2;i:478;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:549;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:456:"
uniform sampler2D u_Texture;    // The input texture.
...
varying vec2 v_TexCoordinate; // Interpolated texture coordinate per fragment.
... 
// Add attenuation.
 diffuse = diffuse * (1.0 / (1.0 + (0.10 * distance)));
...
// Add ambient lighting
 diffuse = diffuse + 0.3;
...
// Multiply the color by the diffuse illumination level and texture value to get final output color.
 
gl_FragColor = (v_Color * diffuse * texture2D(u_Texture, v_TexCoordinate));
";i:1;s:4:"java";i:2;N;}i:2;i:549;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:549;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"3.加载纹理";}i:2;i:1020;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1040;}i:19;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1190:"
public static int loadTexture(final Context context, final int resourceId)
{
    final int[] textureHandle = new int[1];
 
    GLES20.glGenTextures(1, textureHandle, 0);
 
    if (textureHandle[0] != 0)
    {
        final BitmapFactory.Options options = new BitmapFactory.Options();
        options.inScaled = false;   // No pre-scaling
 
        // Read in the resource
        final Bitmap bitmap = BitmapFactory.decodeResource(context.getResources(), resourceId, options);
 
        // Bind to the texture in OpenGL
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, textureHandle[0]);
 
        // Set filtering
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_NEAREST);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_NEAREST);
 
        // Load the bitmap into the bound texture.
        GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, bitmap, 0);
 
        // Recycle the bitmap, since its data has been loaded into OpenGL.
        bitmap.recycle();
    }
 
    if (textureHandle[0] == 0)
    {
        throw new RuntimeException("Error loading texture.");
    }
 
    return textureHandle[0];
}
";i:1;s:4:"java";i:2;N;}i:2;i:1040;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1040;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"在loadTexture()方法中主要分4步进行";}i:2;i:2245;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2289;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2289;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:"（1）通知Opengl创建Texture handle,它是指向texture的唯一标识符";}i:2;i:2291;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2374;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:84:"
final int[] textureHandle = new int[1];
GLES20.glGenTextures(1, textureHandle, 0);
";i:1;s:4:"java";i:2;N;}i:2;i:2374;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2374;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"(2)创建Bitmap对象";}i:2;i:2473;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2500;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:237:"
final BitmapFactory.Options options = new BitmapFactory.Options();
options.inScaled = false;   // No pre-scaling
 
// Read in the resource
final Bitmap bitmap = BitmapFactory.decodeResource(context.getResources(), resourceId, options);
";i:1;s:4:"java";i:2;N;}i:2;i:2500;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2500;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"(3)绑定纹理";}i:2;i:2752;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2773;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:305:"
// Bind to the texture in OpenGL
GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, textureHandle[0]);
 
// Set filtering
GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_NEAREST);
GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_NEAREST);
";i:1;s:4:"java";i:2;N;}i:2;i:2773;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2773;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"(4)把创建的bitmap贴到纹理中";}i:2;i:3093;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3135;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:187:"
// Load the bitmap into the bound texture.
GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, bitmap, 0);
 
// Recycle the bitmap, since its data has been loaded into OpenGL.
bitmap.recycle();
";i:1;s:4:"java";i:2;N;}i:2;i:3135;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3135;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"4.把纹理应用到场景中";}i:2;i:3337;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3366;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3366;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:115:"（1）定义纹理数据，纹理是通过平面坐标表示（s,t）或者（x,y），可以自定义纹理坐标";}i:2;i:3368;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3489;}i:45;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1219:"
/** Store our model data in a float buffer. */
private final FloatBuffer mCubeTextureCoordinates;
 
/** This will be used to pass in the texture. */
private int mTextureUniformHandle;
 
/** This will be used to pass in model texture coordinate information. */
private int mTextureCoordinateHandle;
 
/** Size of the texture coordinate data in elements. */
private final int mTextureCoordinateDataSize = 2;
 
/** This is a handle to our texture data. */
private int mTextureDataHandle;

We basically need to add new members to track what we added to the shaders, as well as hold a reference to our texture.
Defining the texture coordinates

We define our texture coordinates in the constructor:
// S, T (or X, Y)
// Texture coordinate data.
// Because images have a Y axis pointing downward (values increase as you move down the image) while
// OpenGL has a Y axis pointing upward, we adjust for that here by flipping the Y axis.
// What's more is that the texture coordinates are the same for every face.
final float[] cubeTextureCoordinateData =
{
        // Front face
        0.0f, 0.0f,
        0.0f, 1.0f,
        1.0f, 0.0f,
        0.0f, 1.0f,
        1.0f, 1.0f,
        1.0f, 0.0f,
        
        .......
}
";i:1;s:4:"java";i:2;N;}i:2;i:3489;}i:46;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3489;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"(2)创建纹理";}i:2;i:4723;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4744;}i:49;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:593:"
public void onSurfaceCreated(GL10 glUnused, EGLConfig config)
{
 
    ...
 
    // The below glEnable() call is a holdover from OpenGL ES 1, and is not needed in OpenGL ES 2.
    // Enable texture mapping
    // GLES20.glEnable(GLES20.GL_TEXTURE_2D);
 
    ...
 
    mProgramHandle = ShaderHelper.createAndLinkProgram(vertexShaderHandle, fragmentShaderHandle,
            new String[] {"a_Position",  "a_Color", "a_Normal", "a_TexCoordinate"});
 
    ...
 
    // Load the texture
    mTextureDataHandle = TextureHelper.loadTexture(mActivityContext, R.drawable.bumpy_bricks_public_domain);
}
";i:1;s:4:"java";i:2;N;}i:2;i:4744;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4744;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"（3）使用纹理";}i:2;i:5352;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5377;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:614:"
@Override
public void onDrawFrame(GL10 glUnused)
{
 
    ...
 
    mTextureUniformHandle = GLES20.glGetUniformLocation(mProgramHandle, "u_Texture");
    mTextureCoordinateHandle = GLES20.glGetAttribLocation(mProgramHandle, "a_TexCoordinate");
 
    // Set the active texture unit to texture unit 0.
    GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
 
    // Bind the texture to this unit.
    GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, mTextureDataHandle);
 
    // Tell the texture uniform sampler to use this texture in the shader by binding to texture unit 0.
    GLES20.glUniform1i(mTextureUniformHandle, 0);
}
";i:1;s:4:"java";i:2;N;}i:2;i:5377;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5377;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:213:"5.加载着色器，顶点着色器（Vertex Shader）和片元着色器(Fragment Shader)可以通过着色器语言编写成独立的文件（.glsl为后缀的文件）,也可以直接在
当前文件中编写。";}i:2;i:6007;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6220;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6220;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"（1）per_pixel_vertex_shader.glsl文件";}i:2;i:6222;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6269;}i:60;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1755:"
uniform mat4 u_MVPMatrix;		// A constant representing the combined model/view/projection matrix.      		       
uniform mat4 u_MVMatrix;		// A constant representing the combined model/view matrix.       		
		  			
attribute vec4 a_Position;		// Per-vertex position information we will pass in.   				
attribute vec4 a_Color;			// Per-vertex color information we will pass in. 				
attribute vec3 a_Normal;		// Per-vertex normal information we will pass in.      
attribute vec2 a_TexCoordinate; // Per-vertex texture coordinate information we will pass in. 		
		  
varying vec3 v_Position;		// This will be passed into the fragment shader.       		
varying vec4 v_Color;			// This will be passed into the fragment shader.          		
varying vec3 v_Normal;			// This will be passed into the fragment shader.  
varying vec2 v_TexCoordinate;   // This will be passed into the fragment shader.    		
		  
// The entry point for our vertex shader.  
void main()                                                 	
{                                                         
	// Transform the vertex into eye space. 	
	v_Position = vec3(u_MVMatrix * a_Position);            
		
	// Pass through the color.
	v_Color = a_Color;
	
	// Pass through the texture coordinate.
	v_TexCoordinate = a_TexCoordinate;                                      
	
	// Transform the normal's orientation into eye space.
    v_Normal = vec3(u_MVMatrix * vec4(a_Normal, 0.0));
          
	// gl_Position is a special variable used to store the final position.
	// Multiply the vertex by the matrix to get the final point in normalized screen coordinates.
	gl_Position = u_MVPMatrix * a_Position;                       		  
}                                                          

";i:1;s:4:"java";i:2;N;}i:2;i:6269;}i:61;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6269;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"（2）per_pixel_fragment_shader.glsl";}i:2;i:8039;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8082;}i:64;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1725:"
precision mediump float;       	// Set the default precision to medium. We don't need as high of a 
								// precision in the fragment shader.
uniform vec3 u_LightPos;       	// The position of the light in eye space.
uniform sampler2D u_Texture;    // The input texture.
  
varying vec3 v_Position;		// Interpolated position for this fragment.
varying vec4 v_Color;          	// This is the color from the vertex shader interpolated across the 
  								// triangle per fragment.
varying vec3 v_Normal;         	// Interpolated normal for this fragment.
varying vec2 v_TexCoordinate;   // Interpolated texture coordinate per fragment.
  
// The entry point for our fragment shader.
void main()                    		
{                              
    // Will be used for attenuation.
    float distance = length(u_LightPos - v_Position);                  
	
    // Get a lighting direction vector from the light to the vertex.
    vec3 lightVector = normalize(u_LightPos - v_Position);              	

    // Calculate the dot product of the light vector and vertex normal. If the normal and light vector are
    // pointing in the same direction then it will get max illumination.
    float diffuse = max(dot(v_Normal, lightVector), 0.0);               	  		  													  

    // Add attenuation. 
    diffuse = diffuse * (1.0 / (1.0 + (0.10 * distance)));
    
    // Add ambient lighting
    diffuse = diffuse + 0.3;  
    // Multiply the color by the diffuse illumination level and texture value to get final output color.
    gl_FragColor = (v_Color * diffuse * texture2D(u_Texture, v_TexCoordinate));                                  		
}                                                                     	
";i:1;s:4:"java";i:2;N;}i:2;i:8082;}i:65;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8082;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"(3)加载.glsl文件";}i:2;i:9822;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9848;}i:68;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:759:"
public class RawResourceReader {

    public static String readTextFileFromRawResource(final Context context, final int resourceId){

        final InputStream inputStream = context.getResources().openRawResource(resourceId);
        final InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
        final BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

        String nextLine;
        final StringBuilder body = new StringBuilder();
        try{
            while((nextLine = bufferedReader.readLine()) != null){
                body.append(nextLine);
                body.append('\n');
            }
        }catch (IOException e){
            return null;
        }

        return body.toString();
    }
}

";i:1;s:4:"java";i:2;N;}i:2;i:9848;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9848;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"6.详细案例";}i:2;i:10623;}i:71;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10637;}i:72;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10637;}i:73;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"（1）创建Activity";}i:2;i:10639;}i:74;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10666;}i:75;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1659:"
package com.learnopengles.android.lesson4;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ConfigurationInfo;
import android.opengl.GLSurfaceView;
import android.os.Bundle;

public class LessonFourActivity extends Activity 
{
	/** Hold a reference to our GLSurfaceView */
	private GLSurfaceView mGLSurfaceView;

	@Override
	public void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		
		mGLSurfaceView = new GLSurfaceView(this);

		// Check if the system supports OpenGL ES 2.0.
		final ActivityManager activityManager = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
		final ConfigurationInfo configurationInfo = activityManager.getDeviceConfigurationInfo();
		final boolean supportsEs2 = configurationInfo.reqGlEsVersion >= 0x20000;

		if (supportsEs2) 
		{
			// Request an OpenGL ES 2.0 compatible context.
			mGLSurfaceView.setEGLContextClientVersion(2);

			// Set the renderer to our demo renderer, defined below.
			mGLSurfaceView.setRenderer(new LessonFourRenderer(this));
		} 
		else 
		{
			// This is where you could create an OpenGL ES 1.x compatible
			// renderer if you wanted to support both ES 1 and ES 2.
			return;
		}

		setContentView(mGLSurfaceView);
	}

	@Override
	protected void onResume() 
	{
		// The activity must call the GL surface view's onResume() on activity onResume().
		super.onResume();
		mGLSurfaceView.onResume();
	}

	@Override
	protected void onPause() 
	{
		// The activity must call the GL surface view's onPause() on activity onPause().
		super.onPause();
		mGLSurfaceView.onPause();
	}	
}
";i:1;s:4:"java";i:2;N;}i:2;i:10666;}i:76;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10666;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"(2)创建renderer";}i:2;i:12340;}i:78;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12357;}i:79;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20796:"
package com.learnopengles.android.lesson4;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

import android.content.Context;
import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import android.opengl.Matrix;
import android.os.SystemClock;

import com.learnopengles.android.R;
import com.learnopengles.android.common.RawResourceReader;
import com.learnopengles.android.common.ShaderHelper;
import com.learnopengles.android.common.TextureHelper;

/**
 * This class implements our custom renderer. Note that the GL10 parameter passed in is unused for OpenGL ES 2.0
 * renderers -- the static class GLES20 is used instead.
 */
public class LessonFourRenderer implements GLSurfaceView.Renderer 
{	
	/** Used for debug logs. */
	private static final String TAG = "LessonFourRenderer";
	
	private final Context mActivityContext;
	
	/**
	 * Store the model matrix. This matrix is used to move models from object space (where each model can be thought
	 * of being located at the center of the universe) to world space.
	 */
	private float[] mModelMatrix = new float[16];

	/**
	 * Store the view matrix. This can be thought of as our camera. This matrix transforms world space to eye space;
	 * it positions things relative to our eye.
	 */
	private float[] mViewMatrix = new float[16];

	/** Store the projection matrix. This is used to project the scene onto a 2D viewport. */
	private float[] mProjectionMatrix = new float[16];
	
	/** Allocate storage for the final combined matrix. This will be passed into the shader program. */
	private float[] mMVPMatrix = new float[16];
	
	/** 
	 * Stores a copy of the model matrix specifically for the light position.
	 */
	private float[] mLightModelMatrix = new float[16];	
	
	/** Store our model data in a float buffer. */
	private final FloatBuffer mCubePositions;
	private final FloatBuffer mCubeColors;
	private final FloatBuffer mCubeNormals;
	private final FloatBuffer mCubeTextureCoordinates;
	
	/** This will be used to pass in the transformation matrix. */
	private int mMVPMatrixHandle;
	
	/** This will be used to pass in the modelview matrix. */
	private int mMVMatrixHandle;
	
	/** This will be used to pass in the light position. */
	private int mLightPosHandle;
	
	/** This will be used to pass in the texture. */
	private int mTextureUniformHandle;
	
	/** This will be used to pass in model position information. */
	private int mPositionHandle;
	
	/** This will be used to pass in model color information. */
	private int mColorHandle;
	
	/** This will be used to pass in model normal information. */
	private int mNormalHandle;
	
	/** This will be used to pass in model texture coordinate information. */
	private int mTextureCoordinateHandle;

	/** How many bytes per float. */
	private final int mBytesPerFloat = 4;	
	
	/** Size of the position data in elements. */
	private final int mPositionDataSize = 3;	
	
	/** Size of the color data in elements. */
	private final int mColorDataSize = 4;	
	
	/** Size of the normal data in elements. */
	private final int mNormalDataSize = 3;
	
	/** Size of the texture coordinate data in elements. */
	private final int mTextureCoordinateDataSize = 2;
	
	/** Used to hold a light centered on the origin in model space. We need a 4th coordinate so we can get translations to work when
	 *  we multiply this by our transformation matrices. */
	private final float[] mLightPosInModelSpace = new float[] {0.0f, 0.0f, 0.0f, 1.0f};
	
	/** Used to hold the current position of the light in world space (after transformation via model matrix). */
	private final float[] mLightPosInWorldSpace = new float[4];
	
	/** Used to hold the transformed position of the light in eye space (after transformation via modelview matrix) */
	private final float[] mLightPosInEyeSpace = new float[4];
	
	/** This is a handle to our cube shading program. */
	private int mProgramHandle;
		
	/** This is a handle to our light point program. */
	private int mPointProgramHandle;
	
	/** This is a handle to our texture data. */
	private int mTextureDataHandle;
	
	/**
	 * Initialize the model data.
	 */
	public LessonFourRenderer(final Context activityContext)
	{	
		mActivityContext = activityContext;
		
		// Define points for a cube.		
		
		// X, Y, Z
		final float[] cubePositionData =
		{
				// In OpenGL counter-clockwise winding is default. This means that when we look at a triangle, 
				// if the points are counter-clockwise we are looking at the "front". If not we are looking at
				// the back. OpenGL has an optimization where all back-facing triangles are culled, since they
				// usually represent the backside of an object and aren't visible anyways.
				
				// Front face
				-1.0f, 1.0f, 1.0f,				
				-1.0f, -1.0f, 1.0f,
				1.0f, 1.0f, 1.0f, 
				-1.0f, -1.0f, 1.0f, 				
				1.0f, -1.0f, 1.0f,
				1.0f, 1.0f, 1.0f,
				
				// Right face
				1.0f, 1.0f, 1.0f,				
				1.0f, -1.0f, 1.0f,
				1.0f, 1.0f, -1.0f,
				1.0f, -1.0f, 1.0f,				
				1.0f, -1.0f, -1.0f,
				1.0f, 1.0f, -1.0f,
				
				// Back face
				1.0f, 1.0f, -1.0f,				
				1.0f, -1.0f, -1.0f,
				-1.0f, 1.0f, -1.0f,
				1.0f, -1.0f, -1.0f,				
				-1.0f, -1.0f, -1.0f,
				-1.0f, 1.0f, -1.0f,
				
				// Left face
				-1.0f, 1.0f, -1.0f,				
				-1.0f, -1.0f, -1.0f,
				-1.0f, 1.0f, 1.0f, 
				-1.0f, -1.0f, -1.0f,				
				-1.0f, -1.0f, 1.0f, 
				-1.0f, 1.0f, 1.0f, 
				
				// Top face
				-1.0f, 1.0f, -1.0f,				
				-1.0f, 1.0f, 1.0f, 
				1.0f, 1.0f, -1.0f, 
				-1.0f, 1.0f, 1.0f, 				
				1.0f, 1.0f, 1.0f, 
				1.0f, 1.0f, -1.0f,
				
				// Bottom face
				1.0f, -1.0f, -1.0f,				
				1.0f, -1.0f, 1.0f, 
				-1.0f, -1.0f, -1.0f,
				1.0f, -1.0f, 1.0f, 				
				-1.0f, -1.0f, 1.0f,
				-1.0f, -1.0f, -1.0f,
		};	
		
		// R, G, B, A
		final float[] cubeColorData =
		{				
				// Front face (red)
				1.0f, 0.0f, 0.0f, 1.0f,				
				1.0f, 0.0f, 0.0f, 1.0f,
				1.0f, 0.0f, 0.0f, 1.0f,
				1.0f, 0.0f, 0.0f, 1.0f,				
				1.0f, 0.0f, 0.0f, 1.0f,
				1.0f, 0.0f, 0.0f, 1.0f,
				
				// Right face (green)
				0.0f, 1.0f, 0.0f, 1.0f,				
				0.0f, 1.0f, 0.0f, 1.0f,
				0.0f, 1.0f, 0.0f, 1.0f,
				0.0f, 1.0f, 0.0f, 1.0f,				
				0.0f, 1.0f, 0.0f, 1.0f,
				0.0f, 1.0f, 0.0f, 1.0f,
				
				// Back face (blue)
				0.0f, 0.0f, 1.0f, 1.0f,				
				0.0f, 0.0f, 1.0f, 1.0f,
				0.0f, 0.0f, 1.0f, 1.0f,
				0.0f, 0.0f, 1.0f, 1.0f,				
				0.0f, 0.0f, 1.0f, 1.0f,
				0.0f, 0.0f, 1.0f, 1.0f,
				
				// Left face (yellow)
				1.0f, 1.0f, 0.0f, 1.0f,				
				1.0f, 1.0f, 0.0f, 1.0f,
				1.0f, 1.0f, 0.0f, 1.0f,
				1.0f, 1.0f, 0.0f, 1.0f,				
				1.0f, 1.0f, 0.0f, 1.0f,
				1.0f, 1.0f, 0.0f, 1.0f,
				
				// Top face (cyan)
				0.0f, 1.0f, 1.0f, 1.0f,				
				0.0f, 1.0f, 1.0f, 1.0f,
				0.0f, 1.0f, 1.0f, 1.0f,
				0.0f, 1.0f, 1.0f, 1.0f,				
				0.0f, 1.0f, 1.0f, 1.0f,
				0.0f, 1.0f, 1.0f, 1.0f,
				
				// Bottom face (magenta)
				1.0f, 0.0f, 1.0f, 1.0f,				
				1.0f, 0.0f, 1.0f, 1.0f,
				1.0f, 0.0f, 1.0f, 1.0f,
				1.0f, 0.0f, 1.0f, 1.0f,				
				1.0f, 0.0f, 1.0f, 1.0f,
				1.0f, 0.0f, 1.0f, 1.0f
		};
		
		// X, Y, Z
		// The normal is used in light calculations and is a vector which points
		// orthogonal to the plane of the surface. For a cube model, the normals
		// should be orthogonal to the points of each face.
		final float[] cubeNormalData =
		{												
				// Front face
				0.0f, 0.0f, 1.0f,				
				0.0f, 0.0f, 1.0f,
				0.0f, 0.0f, 1.0f,
				0.0f, 0.0f, 1.0f,				
				0.0f, 0.0f, 1.0f,
				0.0f, 0.0f, 1.0f,
				
				// Right face 
				1.0f, 0.0f, 0.0f,				
				1.0f, 0.0f, 0.0f,
				1.0f, 0.0f, 0.0f,
				1.0f, 0.0f, 0.0f,				
				1.0f, 0.0f, 0.0f,
				1.0f, 0.0f, 0.0f,
				
				// Back face 
				0.0f, 0.0f, -1.0f,				
				0.0f, 0.0f, -1.0f,
				0.0f, 0.0f, -1.0f,
				0.0f, 0.0f, -1.0f,				
				0.0f, 0.0f, -1.0f,
				0.0f, 0.0f, -1.0f,
				
				// Left face 
				-1.0f, 0.0f, 0.0f,				
				-1.0f, 0.0f, 0.0f,
				-1.0f, 0.0f, 0.0f,
				-1.0f, 0.0f, 0.0f,				
				-1.0f, 0.0f, 0.0f,
				-1.0f, 0.0f, 0.0f,
				
				// Top face 
				0.0f, 1.0f, 0.0f,			
				0.0f, 1.0f, 0.0f,
				0.0f, 1.0f, 0.0f,
				0.0f, 1.0f, 0.0f,				
				0.0f, 1.0f, 0.0f,
				0.0f, 1.0f, 0.0f,
				
				// Bottom face 
				0.0f, -1.0f, 0.0f,			
				0.0f, -1.0f, 0.0f,
				0.0f, -1.0f, 0.0f,
				0.0f, -1.0f, 0.0f,				
				0.0f, -1.0f, 0.0f,
				0.0f, -1.0f, 0.0f
		};
		
		// S, T (or X, Y)
		// Texture coordinate data.
		// Because images have a Y axis pointing downward (values increase as you move down the image) while
		// OpenGL has a Y axis pointing upward, we adjust for that here by flipping the Y axis.
		// What's more is that the texture coordinates are the same for every face.
		final float[] cubeTextureCoordinateData =
		{												
				// Front face
				0.0f, 0.0f, 				
				0.0f, 1.0f,
				1.0f, 0.0f,
				0.0f, 1.0f,
				1.0f, 1.0f,
				1.0f, 0.0f,				
				
				// Right face 
				0.0f, 0.0f, 				
				0.0f, 1.0f,
				1.0f, 0.0f,
				0.0f, 1.0f,
				1.0f, 1.0f,
				1.0f, 0.0f,	
				
				// Back face 
				0.0f, 0.0f, 				
				0.0f, 1.0f,
				1.0f, 0.0f,
				0.0f, 1.0f,
				1.0f, 1.0f,
				1.0f, 0.0f,	
				
				// Left face 
				0.0f, 0.0f, 				
				0.0f, 1.0f,
				1.0f, 0.0f,
				0.0f, 1.0f,
				1.0f, 1.0f,
				1.0f, 0.0f,	
				
				// Top face 
				0.0f, 0.0f, 				
				0.0f, 1.0f,
				1.0f, 0.0f,
				0.0f, 1.0f,
				1.0f, 1.0f,
				1.0f, 0.0f,	
				
				// Bottom face 
				0.0f, 0.0f, 				
				0.0f, 1.0f,
				1.0f, 0.0f,
				0.0f, 1.0f,
				1.0f, 1.0f,
				1.0f, 0.0f
		};
		
		// Initialize the buffers.
		mCubePositions = ByteBuffer.allocateDirect(cubePositionData.length * mBytesPerFloat)
        .order(ByteOrder.nativeOrder()).asFloatBuffer();							
		mCubePositions.put(cubePositionData).position(0);		
		
		mCubeColors = ByteBuffer.allocateDirect(cubeColorData.length * mBytesPerFloat)
        .order(ByteOrder.nativeOrder()).asFloatBuffer();							
		mCubeColors.put(cubeColorData).position(0);
		
		mCubeNormals = ByteBuffer.allocateDirect(cubeNormalData.length * mBytesPerFloat)
        .order(ByteOrder.nativeOrder()).asFloatBuffer();							
		mCubeNormals.put(cubeNormalData).position(0);
		
		mCubeTextureCoordinates = ByteBuffer.allocateDirect(cubeTextureCoordinateData.length * mBytesPerFloat)
		.order(ByteOrder.nativeOrder()).asFloatBuffer();
		mCubeTextureCoordinates.put(cubeTextureCoordinateData).position(0);
	}
	
	protected String getVertexShader()
	{
		return RawResourceReader.readTextFileFromRawResource(mActivityContext, R.raw.per_pixel_vertex_shader);
	}
	
	protected String getFragmentShader()
	{
		return RawResourceReader.readTextFileFromRawResource(mActivityContext, R.raw.per_pixel_fragment_shader);
	}
	
	@Override
	public void onSurfaceCreated(GL10 glUnused, EGLConfig config) 
	{
		// Set the background clear color to black.
		GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
		
		// Use culling to remove back faces.
		GLES20.glEnable(GLES20.GL_CULL_FACE);
		
		// Enable depth testing
		GLES20.glEnable(GLES20.GL_DEPTH_TEST);
		
		// The below glEnable() call is a holdover from OpenGL ES 1, and is not needed in OpenGL ES 2.
		// Enable texture mapping
		// GLES20.glEnable(GLES20.GL_TEXTURE_2D);
			
		// Position the eye in front of the origin.
		final float eyeX = 0.0f;
		final float eyeY = 0.0f;
		final float eyeZ = -0.5f;

		// We are looking toward the distance
		final float lookX = 0.0f;
		final float lookY = 0.0f;
		final float lookZ = -5.0f;

		// Set our up vector. This is where our head would be pointing were we holding the camera.
		final float upX = 0.0f;
		final float upY = 1.0f;
		final float upZ = 0.0f;

		// Set the view matrix. This matrix can be said to represent the camera position.
		// NOTE: In OpenGL 1, a ModelView matrix is used, which is a combination of a model and
		// view matrix. In OpenGL 2, we can keep track of these matrices separately if we choose.
		Matrix.setLookAtM(mViewMatrix, 0, eyeX, eyeY, eyeZ, lookX, lookY, lookZ, upX, upY, upZ);		

		final String vertexShader = getVertexShader();   		
 		final String fragmentShader = getFragmentShader();			
		
		final int vertexShaderHandle = ShaderHelper.compileShader(GLES20.GL_VERTEX_SHADER, vertexShader);		
		final int fragmentShaderHandle = ShaderHelper.compileShader(GLES20.GL_FRAGMENT_SHADER, fragmentShader);		
		
		mProgramHandle = ShaderHelper.createAndLinkProgram(vertexShaderHandle, fragmentShaderHandle, 
				new String[] {"a_Position",  "a_Color", "a_Normal", "a_TexCoordinate"});								                                							       
        
        // Define a simple shader program for our point.
        final String pointVertexShader = RawResourceReader.readTextFileFromRawResource(mActivityContext, R.raw.point_vertex_shader);        	       
        final String pointFragmentShader = RawResourceReader.readTextFileFromRawResource(mActivityContext, R.raw.point_fragment_shader);
        
        final int pointVertexShaderHandle = ShaderHelper.compileShader(GLES20.GL_VERTEX_SHADER, pointVertexShader);
        final int pointFragmentShaderHandle = ShaderHelper.compileShader(GLES20.GL_FRAGMENT_SHADER, pointFragmentShader);
        mPointProgramHandle = ShaderHelper.createAndLinkProgram(pointVertexShaderHandle, pointFragmentShaderHandle, 
        		new String[] {"a_Position"}); 
        
        // Load the texture
        mTextureDataHandle = TextureHelper.loadTexture(mActivityContext, R.drawable.bumpy_bricks_public_domain);
	}	
		
	@Override
	public void onSurfaceChanged(GL10 glUnused, int width, int height) 
	{
		// Set the OpenGL viewport to the same size as the surface.
		GLES20.glViewport(0, 0, width, height);

		// Create a new perspective projection matrix. The height will stay the same
		// while the width will vary as per aspect ratio.
		final float ratio = (float) width / height;
		final float left = -ratio;
		final float right = ratio;
		final float bottom = -1.0f;
		final float top = 1.0f;
		final float near = 1.0f;
		final float far = 10.0f;
		
		Matrix.frustumM(mProjectionMatrix, 0, left, right, bottom, top, near, far);
	}	

	@Override
	public void onDrawFrame(GL10 glUnused) 
	{
		GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT | GLES20.GL_DEPTH_BUFFER_BIT);			        
                
        // Do a complete rotation every 10 seconds.
        long time = SystemClock.uptimeMillis() % 10000L;        
        float angleInDegrees = (360.0f / 10000.0f) * ((int) time);                
        
        // Set our per-vertex lighting program.
        GLES20.glUseProgram(mProgramHandle);
        
        // Set program handles for cube drawing.
        mMVPMatrixHandle = GLES20.glGetUniformLocation(mProgramHandle, "u_MVPMatrix");
        mMVMatrixHandle = GLES20.glGetUniformLocation(mProgramHandle, "u_MVMatrix"); 
        mLightPosHandle = GLES20.glGetUniformLocation(mProgramHandle, "u_LightPos");
        mTextureUniformHandle = GLES20.glGetUniformLocation(mProgramHandle, "u_Texture");
        mPositionHandle = GLES20.glGetAttribLocation(mProgramHandle, "a_Position");
        mColorHandle = GLES20.glGetAttribLocation(mProgramHandle, "a_Color");
        mNormalHandle = GLES20.glGetAttribLocation(mProgramHandle, "a_Normal"); 
        mTextureCoordinateHandle = GLES20.glGetAttribLocation(mProgramHandle, "a_TexCoordinate");
        
        // Set the active texture unit to texture unit 0.
        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
        
        // Bind the texture to this unit.
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, mTextureDataHandle);
        
        // Tell the texture uniform sampler to use this texture in the shader by binding to texture unit 0.
        GLES20.glUniform1i(mTextureUniformHandle, 0);        
        
        // Calculate position of the light. Rotate and then push into the distance.
        Matrix.setIdentityM(mLightModelMatrix, 0);
        Matrix.translateM(mLightModelMatrix, 0, 0.0f, 0.0f, -5.0f);      
        Matrix.rotateM(mLightModelMatrix, 0, angleInDegrees, 0.0f, 1.0f, 0.0f);
        Matrix.translateM(mLightModelMatrix, 0, 0.0f, 0.0f, 2.0f);
               
        Matrix.multiplyMV(mLightPosInWorldSpace, 0, mLightModelMatrix, 0, mLightPosInModelSpace, 0);
        Matrix.multiplyMV(mLightPosInEyeSpace, 0, mViewMatrix, 0, mLightPosInWorldSpace, 0);                        
        
        // Draw some cubes.        
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.translateM(mModelMatrix, 0, 4.0f, 0.0f, -7.0f);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 1.0f, 0.0f, 0.0f);        
        drawCube();
                        
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.translateM(mModelMatrix, 0, -4.0f, 0.0f, -7.0f);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 0.0f, 1.0f, 0.0f);        
        drawCube();
        
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.translateM(mModelMatrix, 0, 0.0f, 4.0f, -7.0f);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 0.0f, 0.0f, 1.0f);        
        drawCube();
        
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.translateM(mModelMatrix, 0, 0.0f, -4.0f, -7.0f);
        drawCube();
        
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.translateM(mModelMatrix, 0, 0.0f, 0.0f, -5.0f);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 1.0f, 1.0f, 0.0f);        
        drawCube();      
        
        // Draw a point to indicate the light.
        GLES20.glUseProgram(mPointProgramHandle);        
        drawLight();
	}				
	
	/**
	 * Draws a cube.
	 */			
	private void drawCube()
	{		
		// Pass in the position information
		mCubePositions.position(0);		
        GLES20.glVertexAttribPointer(mPositionHandle, mPositionDataSize, GLES20.GL_FLOAT, false,
        		0, mCubePositions);        
                
        GLES20.glEnableVertexAttribArray(mPositionHandle);        
        
        // Pass in the color information
        mCubeColors.position(0);
        GLES20.glVertexAttribPointer(mColorHandle, mColorDataSize, GLES20.GL_FLOAT, false,
        		0, mCubeColors);        
        
        GLES20.glEnableVertexAttribArray(mColorHandle);
        
        // Pass in the normal information
        mCubeNormals.position(0);
        GLES20.glVertexAttribPointer(mNormalHandle, mNormalDataSize, GLES20.GL_FLOAT, false, 
        		0, mCubeNormals);
        
        GLES20.glEnableVertexAttribArray(mNormalHandle);
        
        // Pass in the texture coordinate information
        mCubeTextureCoordinates.position(0);
        GLES20.glVertexAttribPointer(mTextureCoordinateHandle, mTextureCoordinateDataSize, GLES20.GL_FLOAT, false, 
        		0, mCubeTextureCoordinates);
        
        GLES20.glEnableVertexAttribArray(mTextureCoordinateHandle);
        
		// This multiplies the view matrix by the model matrix, and stores the result in the MVP matrix
        // (which currently contains model * view).
        Matrix.multiplyMM(mMVPMatrix, 0, mViewMatrix, 0, mModelMatrix, 0);   
        
        // Pass in the modelview matrix.
        GLES20.glUniformMatrix4fv(mMVMatrixHandle, 1, false, mMVPMatrix, 0);                
        
        // This multiplies the modelview matrix by the projection matrix, and stores the result in the MVP matrix
        // (which now contains model * view * projection).
        Matrix.multiplyMM(mMVPMatrix, 0, mProjectionMatrix, 0, mMVPMatrix, 0);

        // Pass in the combined matrix.
        GLES20.glUniformMatrix4fv(mMVPMatrixHandle, 1, false, mMVPMatrix, 0);
        
        // Pass in the light position in eye space.        
        GLES20.glUniform3f(mLightPosHandle, mLightPosInEyeSpace[0], mLightPosInEyeSpace[1], mLightPosInEyeSpace[2]);
        
        // Draw the cube.
        GLES20.glDrawArrays(GLES20.GL_TRIANGLES, 0, 36);                               
	}	
	
	/**
	 * Draws a point representing the position of the light.
	 */
	private void drawLight()
	{
		final int pointMVPMatrixHandle = GLES20.glGetUniformLocation(mPointProgramHandle, "u_MVPMatrix");
        final int pointPositionHandle = GLES20.glGetAttribLocation(mPointProgramHandle, "a_Position");
        
		// Pass in the position.
		GLES20.glVertexAttrib3f(pointPositionHandle, mLightPosInModelSpace[0], mLightPosInModelSpace[1], mLightPosInModelSpace[2]);

		// Since we are not using a buffer object, disable vertex arrays for this attribute.
        GLES20.glDisableVertexAttribArray(pointPositionHandle);  
		
		// Pass in the transformation matrix.
		Matrix.multiplyMM(mMVPMatrix, 0, mViewMatrix, 0, mLightModelMatrix, 0);
		Matrix.multiplyMM(mMVPMatrix, 0, mProjectionMatrix, 0, mMVPMatrix, 0);
		GLES20.glUniformMatrix4fv(pointMVPMatrixHandle, 1, false, mMVPMatrix, 0);
		
		// Draw the point.
		GLES20.glDrawArrays(GLES20.GL_POINTS, 0, 1);
	}
}
";i:1;s:4:"java";i:2;N;}i:2;i:12364;}i:80;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:12364;}}