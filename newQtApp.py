# -*- coding: utf-8 -*-
# Created by: PyQt4 UI code generator 4.11.4

try:
    from PyQt4 import QtCore, QtGui
except Exception as e:
    print (str(e))

from sys import *
import os, shutil, time

green  = "\033[1;32;40m"
red    = "\033[1;31;40m"
yellow = "\033[1;33;40m"
blue   = "\033[1;34;40m"
white  = "\033[0;103;40m"
usage  = yellow+"[i]"+white+" usage:\n    *   newQtApp.py appname appid\n        for example:\n            newQtApp.py appname1 com.example.appname1\n    *   newQtApp.py gui\n        to run the Graphical User Interface."
source = "./newQtAppSrc"

def replaceInFile(path, src, dest):
    f = open(path, "r")
    text = f.read()
    f.close()
    f = open(path, "w")
    f.write(text.replace(src, dest))
    f.close()

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(613, 323)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.gridLayout_2 = QtGui.QGridLayout(self.centralwidget)
        self.gridLayout_2.setObjectName(_fromUtf8("gridLayout_2"))
        self.verticalLayout_2 = QtGui.QVBoxLayout()
        self.verticalLayout_2.setObjectName(_fromUtf8("verticalLayout_2"))
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.gridLayout = QtGui.QGridLayout()
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(self.centralwidget)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.lineEdit = QtGui.QLineEdit(self.centralwidget)
        self.lineEdit.setInputMask(_fromUtf8(""))
        self.lineEdit.setObjectName(_fromUtf8("lineEdit"))
        self.gridLayout.addWidget(self.lineEdit, 0, 1, 1, 1)
        self.label_2 = QtGui.QLabel(self.centralwidget)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 0, 1, 1)
        self.lineEdit_2 = QtGui.QLineEdit(self.centralwidget)
        self.lineEdit_2.setObjectName(_fromUtf8("lineEdit_2"))
        self.gridLayout.addWidget(self.lineEdit_2, 1, 1, 1, 1)
        self.horizontalLayout.addLayout(self.gridLayout)
        self.verticalLayout = QtGui.QVBoxLayout()
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.pushButton = QtGui.QPushButton(self.centralwidget)
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.verticalLayout.addWidget(self.pushButton)
        self.pushButton_2 = QtGui.QPushButton(self.centralwidget)
        self.pushButton_2.setObjectName(_fromUtf8("pushButton_2"))
        self.verticalLayout.addWidget(self.pushButton_2)
        self.horizontalLayout.addLayout(self.verticalLayout)
        self.verticalLayout_2.addLayout(self.horizontalLayout)
        self.plainTextEdit = QtGui.QPlainTextEdit(self.centralwidget)
        self.plainTextEdit.setObjectName(_fromUtf8("plainTextEdit"))
        self.verticalLayout_2.addWidget(self.plainTextEdit)
        self.gridLayout_2.addLayout(self.verticalLayout_2, 0, 0, 1, 1)
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtGui.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 613, 28))
        self.menubar.setObjectName(_fromUtf8("menubar"))
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName(_fromUtf8("statusbar"))
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QObject.connect(self.pushButton, QtCore.SIGNAL(_fromUtf8("pressed()")), self.create_project)
        QtCore.QObject.connect(self.pushButton_2, QtCore.SIGNAL(_fromUtf8("pressed()")), MainWindow.close)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def create_project(self):
        argv1 = str(self.lineEdit.text())
        argv2 = str(self.lineEdit_2.text())
        if argv1 == "" or argv2 == "":
            self.plainTextEdit.appendHtml("<font color='red'>[e]</font> App name or app id is empty.")
        else:
            try:
                #you may change os.getenv("HOME")+"/QtProjects/" with your working directory
                location = os.getenv("HOME")+"/QtProjects/"+argv1
                if os.path.exists(location):
                    print (red+"[e]"+white+" "+argv1+" already exits.")
                    self.plainTextEdit.appendHtml("<font color='red'>[e]</font> ["+argv1+"] already exits.")
                else:
                    self.plainTextEdit.appendHtml("\n<font color='orange'>[i]</font> copying files.")
                    print (yellow+"[i]"+white+" setup files."),
                    shutil.copytree(source, location, symlinks=False, ignore=None)
                    self.plainTextEdit.appendHtml("<font color='green'>[done]</font>")
                    print (green+"[done]")
                    #step 2: setup files.
                    self.plainTextEdit.appendHtml("\n<font color='orange'>[i]</font> setup files.")
                    print (yellow+"[i]"+white+" setup files."),
                    os.rename(location+"/newQtAppSrc.pro",location+"/"+argv1+".pro")
                    replaceInFile(location+"/About.qml","%%AppName%%",argv1)
                    replaceInFile(location+"/main.qml","%%AppName%%",argv1)
                    replaceInFile(location+"/platform/android/AndroidManifest.xml","%%AppName%%",argv1)
                    replaceInFile(location+"/platform/android/AndroidManifest.xml","%%AppId%%",argv2)
                    replaceInFile(location+"/RateForm.qml","%%AppId%%",argv[2])
                    self.plainTextEdit.appendHtml("<font color='green'>[done]</font>")
                    print (green+"[done]")
                    #step 3: show the app info.
                    print (yellow+"[i]"+white+" ["+argv1+"] created "+green+"succefully"+white+".")
                    self.plainTextEdit.appendHtml ("\n<font color='orange'>[i]</font> ["+argv1+"] created <font color='green'>succefully</font>.")
                    self.plainTextEdit.appendHtml ("&nbsp;&nbsp;&nbsp;&nbsp;app name     : "+argv1)
                    self.plainTextEdit.appendHtml ("&nbsp;&nbsp;&nbsp;&nbsp;app version  : "+argv2)
                    self.plainTextEdit.appendHtml ("&nbsp;&nbsp;&nbsp;&nbsp;app location : "+location)
            except Exception as e:
                self.plainTextEdit.appendHtml("\n<font color='red'>[e]</font> "+str(e)+".")
    
    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow", None))
        self.label.setText(_translate("MainWindow", "App name:", None))
        self.lineEdit.setPlaceholderText(_translate("MainWindow", "example", None))
        self.label_2.setText(_translate("MainWindow", "App id      :", None))
        self.lineEdit_2.setPlaceholderText(_translate("MainWindow", "com.example.example", None))
        self.pushButton.setText(_translate("MainWindow", "create", None))
        self.pushButton_2.setText(_translate("MainWindow", "cancel", None))



if __name__ == "__main__":
    argc = len(argv)
    if argc > 3:
        print (red+"[e]"+white+" too much arguments.")
        print (usage)
        exit(1)
    elif argc == 1:
        app = QtGui.QApplication(argv)
        MainWindow = QtGui.QMainWindow()
        ui = Ui_MainWindow()
        ui.setupUi(MainWindow)
        MainWindow.show()
        exit(app.exec_())
    elif argc == 2:
        if argv[argc - 1] == "gui":
            #run gui here
            print (yellow+"[i]"+white+" runing GUI.")
            app = QtGui.QApplication(argv)
            MainWindow = QtGui.QMainWindow()
            ui = Ui_MainWindow()
            ui.setupUi(MainWindow)
            MainWindow.show()
            exit(app.exec_())
        else:
            print (red+"[e]"+white+" invalid argument.")
            print (usage)
            exit(3)
    #step 1: copying template files.
    try:
        #you may change os.getenv("HOME")+"/QtProjects/" with your working directory
        location = os.getenv("HOME")+"/QtProjects/"+argv[1]
        if os.path.exists(location):
            print (red+"[e]"+white+" ["+argv[1]+"] already exits.")
            exit(4)
        print (yellow+"[i]"+white+" copying files."),
        shutil.copytree(source, location, symlinks=False, ignore=None)
        print (green+"[done]")
        #step 2: setup files.
        print (yellow+"[i]"+white+" setup files."),
        os.rename(location+"/newQtAppSrc.pro",location+"/"+argv[1]+".pro")
        replaceInFile(location+"/About.qml","%%AppName%%",argv[1])
        replaceInFile(location+"/main.qml","%%AppName%%",argv[1])
	replaceInFile(location+"/main.qml","%%package_name%%",argv[1])
        replaceInFile(location+"/platform/android/AndroidManifest.xml","%%AppName%%",argv[1])
        replaceInFile(location+"/platform/android/AndroidManifest.xml","%%AppId%%",argv[2])
        replaceInFile(location+"/RateForm.qml","%%AppId%%",argv[2])
        print (green+"[done]")
        #step 3: show the app info.
        print (yellow+"[i]"+white+" ["+argv[1]+"] created "+green+"succefully"+white+".")
        print ("    app name     : "+argv[1])
        print ("    app version  : "+argv[2])
        print ("    app location : "+location)
    except Exception as e:
            print (red+"[e]"+white+str(e))
