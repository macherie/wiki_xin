a:40:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"创建Opengl es程序框架";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:28;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:28;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"1.定义IOpenGLDemo接口";}i:2;i:30;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:61;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:240:"
package com.android.opengldemo.example;

import javax.microedition.khronos.opengles.GL10;

public interface IOpenGLDemo {
    //drawScene提供统一的绘制函数，实现主要的绘制图形工作
    public void drawScene(GL10 gl);
}
";i:1;s:4:"java";i:2;N;}i:2;i:61;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:61;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"2.创建OpenGLDemoActivity，需要实现IOpenGLDemo接口中的drawScene()方法，完成实际的绘图工作。";}i:2;i:317;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:437;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1567:"
package com.android.opengldemo.example;

import android.app.Activity;
import android.opengl.GLSurfaceView;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;

import javax.microedition.khronos.opengles.GL10;

public class OpenGLDemoActivity extends Activity implements IOpenGLDemo {

    private GLSurfaceView mGLSurfaceView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        //创建GLSurfaceView对象
        mGLSurfaceView = new GLSurfaceView(this);
        //设置渲染器，这步是必须要的
        mGLSurfaceView.setRenderer(new OpenGLRenderer(this));
        setContentView(mGLSurfaceView);
    }


    public void drawScene(GL10 gl){
        //将屏幕背景设置成黑色
        gl.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        //清除color buffer 以及 depth buffer缓存
        gl.glClear(GL10.GL_COLOR_BUFFER_BIT | GL10.GL_DEPTH_BUFFER_BIT);
    }

    @Override
    protected void onResume() {
        super.onResume();
        //必须要在Activity的onResume（）中调用mGLSurfaceView.onResume()方法
        mGLSurfaceView.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        //必须要在Activity的onPause()方法中调用mGLSurfaceView.onPause()方法
        mGLSurfaceView.onPause();
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:437;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:437;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:381:"3.创建OpenGLRenderer类，实现GLSurfaceView.Renderer接口。Renderer接口提供了三个方法，onSurfaceCreated（），onSurfaceChanged（），onDrawFrame（），这三个方法必须实现。onSurfaceCreated（）方法中完成一些不太改变的常用设置，onSurfaceChanged（）主要用于横竖屏幕的切换，onDrawFrame（）完成主要的绘制工作。";}i:2;i:2019;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2400;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1769:"
package com.android.opengldemo.example;

import android.opengl.GLSurfaceView;
import android.opengl.GLU;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;


public class OpenGLRenderer implements GLSurfaceView.Renderer {

    private final IOpenGLDemo mOpenGLDemo;

    public OpenGLRenderer(IOpenGLDemo demo) {
        mOpenGLDemo = demo;
    }

    @Override
    public void onSurfaceCreated(GL10 gl10, EGLConfig eglConfig) {

        //set the background color to back (rgba)
        gl10.glClearColor(0.0f, 0.0f, 0.0f, 0.5f);

        //Enable smooth shade
        gl10.glShadeModel(GL10.GL_SMOOTH);

        // Depth buffer setup
        gl10.glClearDepthf(1.0f);

        //Enable Depth test
        gl10.glEnable(GL10.GL_DEPTH_TEST);

        //The type of Depth testing to do
        gl10.glDepthFunc(GL10.GL_LEQUAL);

        // Really nice perspective calculations.
        gl10.glHint(GL10.GL_PERSPECTIVE_CORRECTION_HINT, GL10.GL_NICEST);
    }

    @Override
    public void onSurfaceChanged(GL10 gl, int width, int height) {

        //Set the current view port to the new size
        gl.glViewport(0, 0 , width, height);

        //Select the projection matrix
        gl.glMatrixMode(GL10.GL_PROJECTION);

        //Reset the projection matrix
        gl.glLoadIdentity();

        //Caculate the aspect radio of window
        GLU.gluPerspective(gl,45.0f, (float)width/(float)height, 1.0f, 100f);

        //Select the Modelview matrix
        gl.glMatrixMode(GL10.GL_MODELVIEW);

        //Reset the modelview matrix
        gl.glLoadIdentity();
    }

    @Override
    public void onDrawFrame(GL10 gl10) {
        if (mOpenGLDemo != null){
            mOpenGLDemo.drawScene(gl10);
        }
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:2407;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2407;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"4.在屏幕上绘制点";}i:2;i:4192;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4215;}i:19;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1501:"
package com.android.opengldemo.example;

import android.os.Bundle;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

import javax.microedition.khronos.opengles.GL10;


public class DrawPointActivity extends OpenGLDemoActivity implements IOpenGLDemo{

    float[] vertexArray = new float[]{
            -0.8f , -0.4f * 1.732f , 0.0f ,
            0.8f , -0.4f * 1.732f , 0.0f ,
            -0.4f * 1.732f , 0.0f
    };

    @Override
    protected  void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
    }

    public void drawScene(GL10 gl){

        super.drawScene(gl);

        ByteBuffer vbb = ByteBuffer.allocateDirect(vertexArray.length * 4);
        vbb.order(ByteOrder.nativeOrder());
        FloatBuffer vertex = vbb.asFloatBuffer();
        vertex.put(vertexArray);
        vertex.position(0);
        gl.glColor4f(0.0f, 1.0f, 0.0f, 1.0f);//rgba
        gl.glPointSize(8f);//point size
        //设置单位矩阵
        gl.glLoadIdentity();
        //向z-方向平移4个单位
        gl.glTranslatef(0 , 0, -4);
        //打开 Pipeline 的Vectex 顶点“开关”
        gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
        //通知 OpenGL ES 图形库顶点坐标
        gl.glVertexPointer(3, GL10.GL_FLOAT, 0, vertex);
        //绘制点
        gl.glDrawArrays(GL10.GL_POINTS, 0, 3);
        //关闭 Pipeline 的Vectex 顶点“开关”
        gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);
    }
}

";i:1;s:4:"java";i:2;N;}i:2;i:4222;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4222;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:322:"5.在DrawPointActivity类中有几个知识点需要说明，FloatBuffer以及一些绘图指令，如glDrawArrays（）。OpenGL ES 为了提高性能，通常将顶点，颜色等值存放在 java.nio 包中定义的 Buffer 类中，其中包括FloatBuffer,IntBuffer, ShortBuffer,ByteBuffer等。其使用方式如下：";}i:2;i:5739;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6067;}i:23;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:678:"
    //定义顶点坐标
    float[] vertexArray = new float[]{
            -0.8f , -0.4f * 1.732f , 0.0f ,
            0.8f , -0.4f * 1.732f , 0.0f ,
            -0.4f * 1.732f , 0.0f
    };
    //创建FloatBuffer对象，并把数据保存到FloatBuffer中，vertexArray.length表示定点数组长度，一个float占4个字节，故乘4，表示需要分配的地址空间
    ByteBuffer vbb = ByteBuffer.allocateDirect(vertexArray.length * 4);
    vbb.order(ByteOrder.nativeOrder());
    FloatBuffer vertex = vbb.asFloatBuffer();
    //将数据保存到FloatBuffer对象vertex中
    vertex.put(vertexArray);
    //指向数组第一个元素
    vertex.position(0);   
";i:1;s:4:"java";i:2;N;}i:2;i:6067;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6067;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"OpenGL ES 提供了两类方法来绘制一个空间几何图形：";}i:2;i:6761;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6828;}i:27;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:317:"
// 使用 VetexBuffer 来绘制，顶点的顺序由 vertexBuffer 中的顺序指定。
public abstract void glDrawArrays(int mode, int first, int count)
//可以重新定义顶点的顺序，顶点的顺序由 indices Buffer 指定
public abstract void glDrawElements(int mode, int count, int type, Buffer indices)
";i:1;s:4:"java";i:2;N;}i:2;i:6835;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6835;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"其中mode表示要绘制什么图形，如GL_POINTS,GL_LINES,GL_TRIANGLES等。";}i:2;i:7167;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7247;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7247;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"打开顶点开关和关闭顶点开关的方法如下：";}i:2;i:7249;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7312;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:96:"
gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);

gl.glDisableClientState(GL10.GL_VERTEX_ARRAY); 
";i:1;s:4:"java";i:2;N;}i:2;i:7312;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7312;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"6.绘制20面体";}i:2;i:7424;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7440;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4150:"
package com.android.opengldemo.example;

import android.os.Bundle;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.ShortBuffer;

import javax.microedition.khronos.opengles.GL10;


/**
 * 
 * 20面体有12个顶点，20个面，30条边
 */
public class DrawTweentyFaceActivity extends OpenGLDemoActivity implements IOpenGLDemo {

    //顶点坐标
    static final float X = .525731112119133606f;
    static final float Z = .850650808352039932f;
    static float vertices[] = new float[]{
            -X,  0.0f,  Z,  //v0
             X,  0.0f,  Z,  //v1
            -X,  0.0f, -Z,  //v2
             X,  0.0f, -Z,  //v3
            0.0f,   Z,  X,  //v4
            0.0f,   Z, -X,  //v5
            0.0f,  -Z,  X,  //v6
            0.0f,  -Z, -X,  //v7
               Z,  X, 0.0f, //v8
              -Z,  X, 0.0f, //v9
               Z, -X, 0.0f, //v10
              -Z, -X, 0.0f  //v11
    };

    //20面坐标
    static short indices[] = new short[]{
            0, 4, 1,    //用v0,v4,v1三个顶点构建第一个三角形
            0, 9, 4,    //用v0,v9,v4三个顶点构建第二个三角形
            9, 5, 4,
            4, 5, 8,
            4, 8, 1,
            8, 10, 1,
            8, 3, 10,
            5, 3, 8,
            5, 2, 3,
            2, 7, 3,
            7, 10, 3,
            7, 6, 10,
            7, 11, 6,
            11, 0, 6,
            0, 1, 6,
            6, 1, 10,
            9, 0, 11,
            9, 11, 2,
            9, 2, 5,
            7, 2, 11  //用v0,v9,v4三个顶点构建第20个三角形
    };

    //顶点颜色坐标
    float[] colors = {
            0f, 0f, 0f, 1f,
            0f, 0f, 1f, 1f,
            0f, 1f, 0f, 1f,
            0f, 1f, 1f, 1f,
            1f, 0f, 0f, 1f,
            1f, 0f, 1f, 1f,
            1f, 1f, 0f, 1f,
            1f, 1f, 1f, 1f,
            1f, 0f, 0f, 1f,
            0f, 1f, 0f, 1f,
            0f, 0f, 1f, 1f,
            1f, 0f, 1f, 1f
    };


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void drawScene(GL10 gl) {
        super.drawScene(gl);

        int angle = 5;
        
        //使用FloatBuffer存储顶点数据
        ByteBuffer vbb = ByteBuffer.allocateDirect(vertices.length*4);
        vbb.order(ByteOrder.nativeOrder());
        FloatBuffer vertex = vbb.asFloatBuffer();
        vertex.put(vertices);
        vertex.position(0);
        
        //使用ShortBuffer存储索引数据
        vbb = ByteBuffer.allocateDirect(indices.length*2);
        vbb.order(ByteOrder.nativeOrder());
        ShortBuffer index = vbb.asShortBuffer();
        index.put(indices);
        index.position(0);
        
        //使用FloatBuffer存储颜色
        vbb = ByteBuffer.allocateDirect(colors.length*4);
        vbb.order(ByteOrder.nativeOrder());
        FloatBuffer color = vbb.asFloatBuffer();
        color.put(colors);
        color.position(0);

        gl.glColor4f(1.0f,0.0f,0.0f,1.0f);
        //设置单位矩阵
        gl.glLoadIdentity();
        gl.glTranslatef(0,0, -4);
        gl.glRotatef(angle, 0, 1, 0);
        //设置逆时针方向为正方向
        gl.glFrontFace(GL10.GL_CCW);
        //如下两个命令可以达到忽略背面的效果，即不渲染back face
        gl.glEnable(GL10.GL_CULL_FACE);
        gl.glCullFace(GL10.GL_BACK);
        //打开顶点开关
        gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
        //将顶点坐标传给 OpenGL 管道
        gl.glVertexPointer(3,GL10.GL_FLOAT,0,vertex);
        //打开颜色开关
        gl.glEnableClientState(GL10.GL_COLOR_ARRAY);
        //将颜色坐标传给openGL 管道
        gl.glColorPointer(4,GL10.GL_FLOAT, 0, color);
        //绘制三角形
        gl.glDrawElements(GL10.GL_TRIANGLES,indices.length,GL10.GL_UNSIGNED_SHORT,index);
        //关闭顶点开关
        gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);
        //关闭颜色开关
        gl.glDisableClientState(GL10.GL_COLOR_ARRAY);
        gl.glDisable(GL10.GL_CULL_FACE);
        angle += 5;

    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:7447;}i:39;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:7447;}}