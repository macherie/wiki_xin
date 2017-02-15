a:55:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"1.Opengl es2 学习网址：";}i:2;i:1;}i:3;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:64:"http://www.learnopengles.com/android-lesson-one-getting-started/";i:1;N;}i:2;i:29;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:93;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:93;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"2.OpenGL ES2 例子";}i:2;i:95;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:114;}i:8;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1728:"
package com.learnopengles.android.lesson1;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ConfigurationInfo;
import android.opengl.GLSurfaceView;
import android.os.Bundle;

public class LessonOneActivity extends Activity 
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
                //获取平台配置信息，判断是否支持opengl es2
		final ConfigurationInfo configurationInfo = activityManager.getDeviceConfigurationInfo();
		final boolean supportsEs2 = configurationInfo.reqGlEsVersion >= 0x20000;

		if (supportsEs2) 
		{
			// Request an OpenGL ES 2.0 compatible context.
			mGLSurfaceView.setEGLContextClientVersion(2);

			// Set the renderer to our demo renderer, defined below.
			mGLSurfaceView.setRenderer(new LessonOneRenderer());
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

";i:1;s:4:"java";i:2;N;}i:2;i:121;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:13644:"
package com.learnopengles.android.lesson1;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import android.opengl.Matrix;
import android.os.SystemClock;

/**
 * This class implements our custom renderer. Note that the GL10 parameter passed in is unused for OpenGL ES 2.0
 * renderers -- the static class GLES20 is used instead.
 */
public class LessonOneRenderer implements GLSurfaceView.Renderer 
{
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
	
	/** Store our model data in a float buffer. */
	private final FloatBuffer mTriangle1Vertices;
	private final FloatBuffer mTriangle2Vertices;
	private final FloatBuffer mTriangle3Vertices;

	/** This will be used to pass in the transformation matrix. */
	private int mMVPMatrixHandle;
	
	/** This will be used to pass in model position information. */
	private int mPositionHandle;
	
	/** This will be used to pass in model color information. */
	private int mColorHandle;

	/** How many bytes per float. */
	private final int mBytesPerFloat = 4;
	
	/** How many elements per vertex. */
	private final int mStrideBytes = 7 * mBytesPerFloat;	
	
	/** Offset of the position data. */
	private final int mPositionOffset = 0;
	
	/** Size of the position data in elements. */
	private final int mPositionDataSize = 3;
	
	/** Offset of the color data. */
	private final int mColorOffset = 3;
	
	/** Size of the color data in elements. */
	private final int mColorDataSize = 4;		
				
	/**
	 * Initialize the model data.
	 */
	public LessonOneRenderer()
	{	
		// Define points for equilateral triangles.
		
		// This triangle is red, green, and blue.
		final float[] triangle1VerticesData = {
		    // X, Y, Z, 
		    // R, G, B, A
	            -0.5f, -0.25f, 0.0f,     //表示顶点v1的坐标
	            1.0f, 0.0f, 0.0f, 1.0f,  //表示顶点v1的颜色
	            
	            0.5f, -0.25f, 0.0f,      //表示顶点v2的坐标
	            0.0f, 0.0f, 1.0f, 1.0f,  //表示顶点v2的颜色
	            
	            0.0f, 0.559016994f, 0.0f, //表示顶点v3的坐标
	            0.0f, 1.0f, 0.0f, 1.0f};  //表示顶点v3的颜色
		
		// This triangle is yellow, cyan, and magenta.
		final float[] triangle2VerticesData = {
		    // X, Y, Z, 
		    // R, G, B, A
	            -0.5f, -0.25f, 0.0f, 
	            1.0f, 1.0f, 0.0f, 1.0f,
	            
	            0.5f, -0.25f, 0.0f, 
	            0.0f, 1.0f, 1.0f, 1.0f,
	            
	            0.0f, 0.559016994f, 0.0f, 
	            1.0f, 0.0f, 1.0f, 1.0f};
		
		// This triangle is white, gray, and black.
		final float[] triangle3VerticesData = {
		    // X, Y, Z, 
		    // R, G, B, A
	            -0.5f, -0.25f, 0.0f, 
	            1.0f, 1.0f, 1.0f, 1.0f,
	            
	            0.5f, -0.25f, 0.0f, 
	            0.5f, 0.5f, 0.5f, 1.0f,
	            
	            0.0f, 0.559016994f, 0.0f, 
	            0.0f, 0.0f, 0.0f, 1.0f};
		
		// Initialize the buffers.
		mTriangle1Vertices = ByteBuffer.allocateDirect(triangle1VerticesData.length * mBytesPerFloat)
                         .order(ByteOrder.nativeOrder()).asFloatBuffer();
		mTriangle2Vertices = ByteBuffer.allocateDirect(triangle2VerticesData.length * mBytesPerFloat)
                         .order(ByteOrder.nativeOrder()).asFloatBuffer();
		mTriangle3Vertices = ByteBuffer.allocateDirect(triangle3VerticesData.length * mBytesPerFloat)
                         .order(ByteOrder.nativeOrder()).asFloatBuffer();
					
		mTriangle1Vertices.put(triangle1VerticesData).position(0);
		mTriangle2Vertices.put(triangle2VerticesData).position(0);
		mTriangle3Vertices.put(triangle3VerticesData).position(0);
	}
	
	@Override
	public void onSurfaceCreated(GL10 glUnused, EGLConfig config) 
	{
		// Set the background clear color to gray.
		GLES20.glClearColor(0.5f, 0.5f, 0.5f, 0.5f);
	
		// Position the eye behind the origin.
		final float eyeX = 0.0f;
		final float eyeY = 0.0f;
		final float eyeZ = 1.5f;

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

		final String vertexShader =
		  "uniform mat4 u_MVPMatrix;      \n"		// A constant representing the combined model/view/projection matrix.
			
		  + "attribute vec4 a_Position;     \n"		// Per-vertex position information we will pass in.
		  + "attribute vec4 a_Color;        \n"		// Per-vertex color information we will pass in.			  
		  
		  + "varying vec4 v_Color;          \n"		// This will be passed into the fragment shader.
		  
		  + "void main()                    \n"		// The entry point for our vertex shader.
		  + "{                              \n"
		  + "   v_Color = a_Color;          \n"		// Pass the color through to the fragment shader. 
		  						// It will be interpolated across the triangle.
		  + "   gl_Position = u_MVPMatrix   \n" 	// gl_Position is a special variable used to store the final position.
		  + "               * a_Position;   \n"         // Multiply the vertex by the matrix to get the final point in 			                                            			 
		  + "}                              \n";        // normalized screen coordinates.
		
		final String fragmentShader =
		  "precision mediump float;       \n"	// Set the default precision to medium. We don't need as high of a 
								// precision in the fragment shader.				
		  + "varying vec4 v_Color;          \n"		// This is the color from the vertex shader interpolated across the 
		  						// triangle per fragment.			  
		  + "void main()                    \n"		// The entry point for our fragment shader.
		  + "{                              \n"
		  + "   gl_FragColor = v_Color;     \n"		// Pass the color directly through the pipeline.		  
		  + "}                             \n";												
		
		// Load in the vertex shader.
		int vertexShaderHandle = GLES20.glCreateShader(GLES20.GL_VERTEX_SHADER);

		if (vertexShaderHandle != 0) 
		{
			// Pass in the shader source.
			GLES20.glShaderSource(vertexShaderHandle, vertexShader);

			// Compile the shader.
			GLES20.glCompileShader(vertexShaderHandle);

			// Get the compilation status.
			final int[] compileStatus = new int[1];
			GLES20.glGetShaderiv(vertexShaderHandle, GLES20.GL_COMPILE_STATUS, compileStatus, 0);

			// If the compilation failed, delete the shader.
			if (compileStatus[0] == 0) 
			{				
				GLES20.glDeleteShader(vertexShaderHandle);
				vertexShaderHandle = 0;
			}
		}

		if (vertexShaderHandle == 0)
		{
			throw new RuntimeException("Error creating vertex shader.");
		}
		
		// Load in the fragment shader shader.
		int fragmentShaderHandle = GLES20.glCreateShader(GLES20.GL_FRAGMENT_SHADER);

		if (fragmentShaderHandle != 0) 
		{
			// Pass in the shader source.
			GLES20.glShaderSource(fragmentShaderHandle, fragmentShader);

			// Compile the shader.
			GLES20.glCompileShader(fragmentShaderHandle);

			// Get the compilation status.
			final int[] compileStatus = new int[1];
			GLES20.glGetShaderiv(fragmentShaderHandle, GLES20.GL_COMPILE_STATUS, compileStatus, 0);

			// If the compilation failed, delete the shader.
			if (compileStatus[0] == 0) 
			{				
				GLES20.glDeleteShader(fragmentShaderHandle);
				fragmentShaderHandle = 0;
			}
		}

		if (fragmentShaderHandle == 0)
		{
			throw new RuntimeException("Error creating fragment shader.");
		}
		
		// Create a program object and store the handle to it.
		int programHandle = GLES20.glCreateProgram();
		
		if (programHandle != 0) 
		{
			// Bind the vertex shader to the program.
			GLES20.glAttachShader(programHandle, vertexShaderHandle);			

			// Bind the fragment shader to the program.
			GLES20.glAttachShader(programHandle, fragmentShaderHandle);
			
			// Bind attributes
			GLES20.glBindAttribLocation(programHandle, 0, "a_Position");
			GLES20.glBindAttribLocation(programHandle, 1, "a_Color");
			
			// Link the two shaders together into a program.
			GLES20.glLinkProgram(programHandle);

			// Get the link status.
			final int[] linkStatus = new int[1];
			GLES20.glGetProgramiv(programHandle, GLES20.GL_LINK_STATUS, linkStatus, 0);

			// If the link failed, delete the program.
			if (linkStatus[0] == 0) 
			{				
				GLES20.glDeleteProgram(programHandle);
				programHandle = 0;
			}
		}
		
		if (programHandle == 0)
		{
			throw new RuntimeException("Error creating program.");
		}
        
        // Set program handles. These will later be used to pass in values to the program.
        mMVPMatrixHandle = GLES20.glGetUniformLocation(programHandle, "u_MVPMatrix");        
        mPositionHandle = GLES20.glGetAttribLocation(programHandle, "a_Position");
        mColorHandle = GLES20.glGetAttribLocation(programHandle, "a_Color");        
        
        // Tell OpenGL to use this program when rendering.
        GLES20.glUseProgram(programHandle);        
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
		GLES20.glClear(GLES20.GL_DEPTH_BUFFER_BIT | GLES20.GL_COLOR_BUFFER_BIT);			        
                
        // Do a complete rotation every 10 seconds.
        long time = SystemClock.uptimeMillis() % 10000L;
        float angleInDegrees = (360.0f / 10000.0f) * ((int) time);
        
        // Draw the triangle facing straight on.
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 0.0f, 0.0f, 1.0f);        
        drawTriangle(mTriangle1Vertices);
        
        // Draw one translated a bit down and rotated to be flat on the ground.
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.translateM(mModelMatrix, 0, 0.0f, -1.0f, 0.0f);
        Matrix.rotateM(mModelMatrix, 0, 90.0f, 1.0f, 0.0f, 0.0f);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 0.0f, 0.0f, 1.0f);        
        drawTriangle(mTriangle2Vertices);
        
        // Draw one translated a bit to the right and rotated to be facing to the left.
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.translateM(mModelMatrix, 0, 1.0f, 0.0f, 0.0f);
        Matrix.rotateM(mModelMatrix, 0, 90.0f, 0.0f, 1.0f, 0.0f);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 0.0f, 0.0f, 1.0f);
        drawTriangle(mTriangle3Vertices);
	}	
	
	/**
	 * Draws a triangle from the given vertex data.
	 * 
	 * @param aTriangleBuffer The buffer containing the vertex data.
	 */
	private void drawTriangle(final FloatBuffer aTriangleBuffer)
	{		
		// Pass in the position information
		aTriangleBuffer.position(mPositionOffset);
        GLES20.glVertexAttribPointer(mPositionHandle, mPositionDataSize, GLES20.GL_FLOAT, false,
        		mStrideBytes, aTriangleBuffer);        
                
        GLES20.glEnableVertexAttribArray(mPositionHandle);        
        
        // Pass in the color information
        aTriangleBuffer.position(mColorOffset);
        GLES20.glVertexAttribPointer(mColorHandle, mColorDataSize, GLES20.GL_FLOAT, false,
        		mStrideBytes, aTriangleBuffer);        
        
        GLES20.glEnableVertexAttribArray(mColorHandle);
        
		// This multiplies the view matrix by the model matrix, and stores the result in the MVP matrix
        // (which currently contains model * view).
        Matrix.multiplyMM(mMVPMatrix, 0, mViewMatrix, 0, mModelMatrix, 0);
        
        // This multiplies the modelview matrix by the projection matrix, and stores the result in the MVP matrix
        // (which now contains model * view * projection).
        Matrix.multiplyMM(mMVPMatrix, 0, mProjectionMatrix, 0, mMVPMatrix, 0);

        GLES20.glUniformMatrix4fv(mMVPMatrixHandle, 1, false, mMVPMatrix, 0);
        GLES20.glDrawArrays(GLES20.GL_TRIANGLES, 0, 3);                               
	}
}

";i:1;s:4:"java";i:2;N;}i:2;i:1870;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1870;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"3.解析：";}i:2;i:15529;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15540;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15540;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:99:"(1)定义顶点和颜色，并把顶点和颜色同时存放在一个数组当中，初始化buffer";}i:2;i:15542;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15641;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:986:"
// New class members
/** Store our model data in a float buffer. */
private final FloatBuffer mTriangle1Vertices;
private final FloatBuffer mTriangle2Vertices;
private final FloatBuffer mTriangle3Vertices;
 
/** How many bytes per float. */
private final int mBytesPerFloat = 4;
 
/**
 * Initialize the model data.
 */
public LessonOneRenderer()
{
    // This triangle is red, green, and blue.
    final float[] triangle1VerticesData = {
            // X, Y, Z,
            // R, G, B, A
            -0.5f, -0.25f, 0.0f,
            1.0f, 0.0f, 0.0f, 1.0f,
 
            0.5f, -0.25f, 0.0f,
            0.0f, 0.0f, 1.0f, 1.0f,
 
            0.0f, 0.559016994f, 0.0f,
            0.0f, 1.0f, 0.0f, 1.0f};
 
    ...
 
    // Initialize the buffers.
    mTriangle1Vertices = ByteBuffer.allocateDirect(triangle1VerticesData.length * mBytesPerFloat)
    .order(ByteOrder.nativeOrder()).asFloatBuffer();
 
    ...
 
    mTriangle1Vertices.put(triangle1VerticesData).position(0);
 
    ...
}
";i:1;s:4:"java";i:2;N;}i:2;i:15648;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15648;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:203:"(2)定义顶点着色器和片元着色器，每个着色器由三部分组成，input, output, program,任何需要显示到屏幕上的东西，首先都需要通过顶点着色器和片元着色器。";}i:2;i:16649;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16858;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1061:"
//顶点着色器
final String vertexShader =
    "uniform mat4 u_MVPMatrix;      \n"     // A constant representing the combined model/view/projection matrix.
 
  + "attribute vec4 a_Position;     \n"     // Per-vertex position information we will pass in.
  + "attribute vec4 a_Color;        \n"     // Per-vertex color information we will pass in.
 
  + "varying vec4 v_Color;          \n"     // This will be passed into the fragment shader.
 
  + "void main()                    \n"     // The entry point for our vertex shader.
  + "{                              \n"
  + "   v_Color = a_Color;          \n"     // Pass the color through to the fragment shader.
                                            // It will be interpolated across the triangle.
  + "   gl_Position = u_MVPMatrix   \n"     // gl_Position is a special variable used to store the final position.
  + "               * a_Position;   \n"     // Multiply the vertex by the matrix to get the final point in
  + "}                              \n";    // normalized screen coordinates.
";i:1;s:4:"java";i:2;N;}i:2;i:16858;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:685:"
//片元着色器
final String fragmentShader =
    "precision mediump float;       \n"     // Set the default precision to medium. We don't need as high of a
                                            // precision in the fragment shader.
  + "varying vec4 v_Color;          \n"     // This is the color from the vertex shader interpolated across the
                                            // triangle per fragment.
  + "void main()                    \n"     // The entry point for our fragment shader.
  + "{                              \n"
  + "   gl_FragColor = v_Color;     \n"     // Pass the color directly through the pipeline.
  + "}                              \n";
";i:1;s:4:"java";i:2;N;}i:2;i:17939;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17939;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"（3）加载着色器到OpenGL中";}i:2;i:18639;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18673;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:763:"
// Load in the vertex shader.
int vertexShaderHandle = GLES20.glCreateShader(GLES20.GL_VERTEX_SHADER);
 
if (vertexShaderHandle != 0)
{
    // Pass in the shader source.
    GLES20.glShaderSource(vertexShaderHandle, vertexShader);
 
    // Compile the shader.
    GLES20.glCompileShader(vertexShaderHandle);
 
    // Get the compilation status.
    final int[] compileStatus = new int[1];
    GLES20.glGetShaderiv(vertexShaderHandle, GLES20.GL_COMPILE_STATUS, compileStatus, 0);
 
    // If the compilation failed, delete the shader.
    if (compileStatus[0] == 0)
    {
        GLES20.glDeleteShader(vertexShaderHandle);
        vertexShaderHandle = 0;
    }
}
 
if (vertexShaderHandle == 0)
{
    throw new RuntimeException("Error creating vertex shader.");
}
";i:1;s:4:"java";i:2;N;}i:2;i:18680;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18680;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:"(4)把顶点着色器和片元着色器链接到porgram当中";}i:2;i:19458;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19525;}i:29;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1005:"
// Create a program object and store the handle to it.
int programHandle = GLES20.glCreateProgram();
 
if (programHandle != 0)
{
    // Bind the vertex shader to the program.
    GLES20.glAttachShader(programHandle, vertexShaderHandle);
 
    // Bind the fragment shader to the program.
    GLES20.glAttachShader(programHandle, fragmentShaderHandle);
 
    // Bind attributes
    GLES20.glBindAttribLocation(programHandle, 0, "a_Position");
    GLES20.glBindAttribLocation(programHandle, 1, "a_Color");
 
    // Link the two shaders together into a program.
    GLES20.glLinkProgram(programHandle);
 
    // Get the link status.
    final int[] linkStatus = new int[1];
    GLES20.glGetProgramiv(programHandle, GLES20.GL_LINK_STATUS, linkStatus, 0);
 
    // If the link failed, delete the program.
    if (linkStatus[0] == 0)
    {
        GLES20.glDeleteProgram(programHandle);
        programHandle = 0;
    }
}
 
if (programHandle == 0)
{
    throw new RuntimeException("Error creating program.");
}
";i:1;s:4:"java";i:2;N;}i:2;i:19525;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19525;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:179:"(5)获取顶点着色器或者片元着色器的属性的引用，然后通过它们传递数据到program当中，最后通知Opengl使用我们自定义的program来绘制图形";}i:2;i:20546;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20731;}i:33;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:804:"
//New class members
/** This will be used to pass in the transformation matrix. */
private int mMVPMatrixHandle;
 
/** This will be used to pass in model position information. */
private int mPositionHandle;
 
/** This will be used to pass in model color information. */
private int mColorHandle;
 
@Override
public void onSurfaceCreated(GL10 glUnused, EGLConfig config)
{
    ...
 
    // Set program handles. These will later be used to pass in values to the program.
    mMVPMatrixHandle = GLES20.glGetUniformLocation(programHandle, "u_MVPMatrix");
    mPositionHandle = GLES20.glGetAttribLocation(programHandle, "a_Position");
    mColorHandle = GLES20.glGetAttribLocation(programHandle, "a_Color");
 
    // Tell OpenGL to use this program when rendering.
    GLES20.glUseProgram(programHandle);
}
";i:1;s:4:"java";i:2;N;}i:2;i:20731;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20731;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"(6)设置view matrix";}i:2;i:21550;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21576;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1238:"
// New class definitions
 /**
 * Store the view matrix. This can be thought of as our camera. This matrix transforms world space to eye space;
 * it positions things relative to our eye.
 */
private float[] mViewMatrix = new float[16];
 
@Override
public void onSurfaceCreated(GL10 glUnused, EGLConfig config)
{
    // Set the background clear color to gray.
    GLES20.glClearColor(0.5f, 0.5f, 0.5f, 0.5f);
 
    // Position the eye behind the origin.
    final float eyeX = 0.0f;
    final float eyeY = 0.0f;
    final float eyeZ = 1.5f;
 
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
 
    ...
｝
";i:1;s:4:"java";i:2;N;}i:2;i:21576;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21576;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"(7)设置projection matrix";}i:2;i:22829;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22861;}i:41;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:801:"
// New class members
/** Store the projection matrix. This is used to project the scene onto a 2D viewport. */
private float[] mProjectionMatrix = new float[16];
 
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
";i:1;s:4:"java";i:2;N;}i:2;i:22861;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22861;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"(8)绘制图形到屏幕上";}i:2;i:23677;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23704;}i:45;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:836:"

    // New class members
    /**
     * Store the model matrix. This matrix is used to move models from object space (where each model can be thought
     * of being located at the center of the universe) to world space.
     */
    private float[] mModelMatrix = new float[16];
 
    @Override
    public void onDrawFrame(GL10 glUnused)
    {
        GLES20.glClear(GLES20.GL_DEPTH_BUFFER_BIT | GLES20.GL_COLOR_BUFFER_BIT);
 
        // Do a complete rotation every 10 seconds.
        long time = SystemClock.uptimeMillis() % 10000L;
        float angleInDegrees = (360.0f / 10000.0f) * ((int) time);
 
        // Draw the triangle facing straight on.
        Matrix.setIdentityM(mModelMatrix, 0);
        Matrix.rotateM(mModelMatrix, 0, angleInDegrees, 0.0f, 0.0f, 1.0f);
        drawTriangle(mTriangle1Vertices);
 
        ...
}

";i:1;s:4:"java";i:2;N;}i:2;i:23711;}i:46;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23711;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"实际绘制三角形的函数：";}i:2;i:24562;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24601;}i:49;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1909:"
// New class members
/** Allocate storage for the final combined matrix. This will be passed into the shader program. */
private float[] mMVPMatrix = new float[16];
 
/** How many elements per vertex. */
private final int mStrideBytes = 7 * mBytesPerFloat;
 
/** Offset of the position data. */
private final int mPositionOffset = 0;
 
/** Size of the position data in elements. */
private final int mPositionDataSize = 3;
 
/** Offset of the color data. */
private final int mColorOffset = 3;
 
/** Size of the color data in elements. */
private final int mColorDataSize = 4;
 
/**
 * Draws a triangle from the given vertex data.
 *
 * @param aTriangleBuffer The buffer containing the vertex data.
 */
private void drawTriangle(final FloatBuffer aTriangleBuffer)
{
    // Pass in the position information
    aTriangleBuffer.position(mPositionOffset);
    GLES20.glVertexAttribPointer(mPositionHandle, mPositionDataSize, GLES20.GL_FLOAT, false,
            mStrideBytes, aTriangleBuffer);
 
    GLES20.glEnableVertexAttribArray(mPositionHandle);
 
    // Pass in the color information
    aTriangleBuffer.position(mColorOffset);
    GLES20.glVertexAttribPointer(mColorHandle, mColorDataSize, GLES20.GL_FLOAT, false,
            mStrideBytes, aTriangleBuffer);
 
    GLES20.glEnableVertexAttribArray(mColorHandle);
 
    // This multiplies the view matrix by the model matrix, and stores the result in the MVP matrix
    // (which currently contains model * view).
    Matrix.multiplyMM(mMVPMatrix, 0, mViewMatrix, 0, mModelMatrix, 0);
 
    // This multiplies the modelview matrix by the projection matrix, and stores the result in the MVP matrix
    // (which now contains model * view * projection).
    Matrix.multiplyMM(mMVPMatrix, 0, mProjectionMatrix, 0, mMVPMatrix, 0);
 
    GLES20.glUniformMatrix4fv(mMVPMatrixHandle, 1, false, mMVPMatrix, 0);
    GLES20.glDrawArrays(GLES20.GL_TRIANGLES, 0, 3);
}
";i:1;s:4:"java";i:2;N;}i:2;i:24601;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24601;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:89:"在编写opengl es2代码时，需要在AndroidManifest.xml文件中添加如下语句：";}i:2;i:26525;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:26620;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:75:"
<uses-feature
android:glEsVersion="0x00020000"
android:required="true" />
";i:1;s:4:"java";i:2;N;}i:2;i:26620;}i:54;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:26620;}}