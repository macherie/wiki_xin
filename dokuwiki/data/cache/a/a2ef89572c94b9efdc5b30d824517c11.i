a:42:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"import time
import datetime
import sys
import getopt
import os";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:63;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:63;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:"a_time = None
s_second = None
s_microsecone = None
abs_time = 0.0
inputfile = None
outputfile = None";}i:2;i:66;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:166;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:166;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"def usage():";}i:2;i:169;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:181;}i:10;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:207:"  print('''Help Information:
           -h, --help:        Show help information
           -i, --inputfile:   input file  to parse
           -o, --outputfile:  output fiel parsed
                      ''')";}i:2;i:181;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:181;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"def calc_delta(stream):";}i:2;i:404;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:427;}i:14;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1033:"  global s_second
  global s_microsecond
  global a_time
  global outfile
  begin_index = None
  end_index = None
  delta_second = 0
  delta_mircosecond = 0
  delta_time = 0
  d_time = None
  new_line = None
  if a_time ==None:
      print("Can't convert to android time")
      exit(-1)
  for line in stream:
      if line:
          try:
              begin_index =  line.index('[')
              end_index = line[begin_index+1:].index(']')+begin_index+1
              time_string = line[begin_index + 1 :end_index]
              [d_second,d_microsecond] = time_string.split('.')
              delta_second = int(int(d_second) - int(s_second))
              delta_microsecond = int(int(d_microsecond)-int(s_microsecond))
              delta_time = datetime.timedelta(seconds=delta_second,microseconds=delta_microsecond)
              d_time = a_time + delta_time
              new_line = d_time.strftime("%m-%d %H:%M:%S.%f")+' ' + line
              outputfile.write(new_line)
          except:
              outputfile.write(line)";}i:2;i:427;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:427;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"def get_atime(stream):";}i:2;i:1524;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1546;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:626:"  global s_second
  global s_microsecond
  global a_time
  a_time_op = None
  begin_index = None
  end_index = None
  for line in stream:
      if line:
          a_time_op = line.find('android time')
          if a_time_op>=1:
              begin_index =  line.index('[')
              end_index = line[begin_index+1:].index(']')+begin_index+1
              date_string = line[a_time_op+13:].strip()
              abs_time = line[begin_index + 1 :end_index]
              [s_second,s_microsecond] = abs_time.split('.')
              a_time = datetime.datetime.strptime(date_string, "%Y-%m-%d %H:%M:%S.%f")
              break";}i:2;i:1546;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1546;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"def main(argv):";}i:2;i:2210;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2225;}i:22;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:577:"  global inputfile
  global outputfile
  inputpath = None
  outputpath = None
  try:
      opts, args = getopt.getopt(argv,"hi:o:",["help","inputfile=","outputfile="])
  except getopt.GetoptError:
      usage()
      sys.exit(2)
  for opt, arg in opts:
      if opt in ("-h", "--help"):
          usage()
          sys.exit()
      if opt in ("-i", "--inputfile"):
          inputpath = arg
      if opt in ("-o", "outputfile"):
          outputpath = arg
  if inputpath == None:
      usage()
      sys.exit()
  if outputpath == None:
      outputpath = os.getcwd()+"/out.txt"";}i:2;i:2225;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2225;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"    inputfile = open(inputpath, 'r')";}i:2;i:2850;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2886;}i:26;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:144:"  outputfile = open(outputpath, 'w')
  get_atime(inputfile)
  inputfile.seek(0)
  calc_delta(inputfile)
  inputfile.close()
  outputfile.close()";}i:2;i:2886;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2886;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"if ";}i:2;i:3044;}i:29;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:3047;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"name";}i:2;i:3049;}i:31;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:3053;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" == ";}i:2;i:3055;}i:33;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:3059;}i:34;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:3060;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"main";}i:2;i:3062;}i:36;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:3066;}i:37;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:3068;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:":";}i:2;i:3069;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3070;}i:40;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:20:"  main(sys.argv[1:])";}i:2;i:3070;}i:41;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3070;}}