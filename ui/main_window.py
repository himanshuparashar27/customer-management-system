import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QTabWidget, QWidget, QVBoxLayout, QLabel

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('Main Window with Tabs')
        self.setGeometry(100, 100, 800, 600)
        self.initUI()

    def initUI(self):
        tabs = QTabWidget()

        # Create tabs
        tab1 = QWidget()  
        tab2 = QWidget()  
        tab3 = QWidget()  
        tab4 = QWidget()  
        tab5 = QWidget()  
        tab6 = QWidget()  

        # Add tabs to the widget
        tabs.addTab(tab1, 'Tab 1')
        tabs.addTab(tab2, 'Tab 2')
        tabs.addTab(tab3, 'Tab 3')
        tabs.addTab(tab4, 'Tab 4')
        tabs.addTab(tab5, 'Tab 5')
        tabs.addTab(tab6, 'Tab 6')

        # Add content to tabs
        tab1_layout = QVBoxLayout()
        tab1_layout.addWidget(QLabel('Content of Tab 1'))
        tab1.setLayout(tab1_layout)

        tab2_layout = QVBoxLayout()
        tab2_layout.addWidget(QLabel('Content of Tab 2'))
        tab2.setLayout(tab2_layout)

        tab3_layout = QVBoxLayout()
        tab3_layout.addWidget(QLabel('Content of Tab 3'))
        tab3.setLayout(tab3_layout)

        tab4_layout = QVBoxLayout()
        tab4_layout.addWidget(QLabel('Content of Tab 4'))
        tab4.setLayout(tab4_layout)

        tab5_layout = QVBoxLayout()
        tab5_layout.addWidget(QLabel('Content of Tab 5'))
        tab5.setLayout(tab5_layout)

        tab6_layout = QVBoxLayout()
        tab6_layout.addWidget(QLabel('Content of Tab 6'))
        tab6.setLayout(tab6_layout)

        self.setCentralWidget(tabs)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())