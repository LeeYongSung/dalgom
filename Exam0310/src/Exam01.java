import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

import javafx.scene.layout.BackgroundImage;

public class Exam01 {
   public static void main(String[] ar){
      Exam01_sub ex = new Exam01_sub();


     
   }
}

class Exam01_sub extends JFrame implements ActionListener ,WindowListener{
	/************추가 부분************/
	JScrollPane scrollPane;
	public static ImageIcon icon;
	/****************************/
   private Container con;
   private BorderLayout border = new BorderLayout();
   ImageIcon image=new ImageIcon("C:\\Users\\user2\\Pictures\\PATTERN1.png");
   //맨위 이벤트 카트 호출 로그아웃 버튼 패널
   private JPanel main_north = new JPanel(new FlowLayout(FlowLayout.RIGHT));
   private JButton event = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\event.png"));
   private JButton cart = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\cart.png"));
   private JButton call = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\bell.png"));
   private JButton logout = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\logout.png"));
   
   //왼쪽 메뉴 탭 버튼 패널
   private JPanel main_west = new JPanel(new GridLayout(6,1));
   private JButton best = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\thumbs-up.png"));
   private JButton pizza = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza.png"));
   private JButton pasta = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pasta.png"));
   private JButton steak = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\steak.png"));
   private JButton dessert = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\dessert.png"));
   private JButton drink = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\wine.png"));
   
   //메뉴 정렬 패널
   private JPanel main_center = new JPanel(new GridLayout(0,3,10,20));
   
   //추천메뉴 구성
   private JButton best1 = new JButton("추천메뉴1");
   private JButton best2 = new JButton("추천메뉴2");
   private JButton best3 = new JButton("추천메뉴3");

   //피자메뉴 구성
   private JButton pizza1 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza1.png"));
   private JButton pizza2 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza2.png"));
   private JButton pizza3 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza3.png"));
   private JButton pizza4 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza4.png"));
   private JButton pizza5 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza5.png"));
   private JButton pizza6 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza6.png"));
   private JButton pizza7 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza7.png"));
   private JButton pizza8 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza8.png"));
   private JButton pizza9 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza9.png"));
   private JButton pizza10 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza10.png"));
   private JButton pizza11 = new JButton(new ImageIcon("C:\\Users\\user2\\Pictures\\pizza11.png"));
   
   //파스타메뉴 구성
   private JButton pasta1 = new JButton("파스타1");
   private JButton pasta2 = new JButton("파스타2");
   private JButton pasta3 = new JButton("파스타3");
   private JButton pasta4 = new JButton("파스타4");
   private JButton pasta5 = new JButton("파스타5");
   private JButton pasta6 = new JButton("파스타6");
   
   //스테이크메뉴 구성
   private JButton steak1 = new JButton("스테이크1");
   private JButton steak2 = new JButton("스테이크2");
   private JButton steak3 = new JButton("스테이크3");
   private JButton steak4 = new JButton("스테이크4");
   private JButton steak5 = new JButton("스테이크5");
   private JButton steak6 = new JButton("스테이크6");

   // 회원 가입 구성 
   private Dialog Registdlg = new Dialog(this, "회원가입 창", false); 
   
   private JLabel reglb1 = new JLabel(" ID : ", JLabel.RIGHT);
   private JLabel reglb2 = new JLabel(" PW : ", JLabel.RIGHT);
   private JLabel reglb3 = new JLabel("이름 : ", JLabel.RIGHT);
   private JLabel reglb4 = new JLabel("생년월일 : ", JLabel.RIGHT);
   private JLabel reglb5 = new JLabel("전화번호 : ", JLabel.RIGHT);
   private JLabel reglb6 = new JLabel("주소 : ", JLabel.RIGHT);
  
   private JTextField regtf1 = new JTextField(14);
   private JTextField regtf2 = new JTextField(14); 
   private JTextField regtf3 = new JTextField(14);
   private JTextField regtf4 = new JTextField(14);
   private JTextField regtf5 = new JTextField(14);
   private JTextField regtf6 = new JTextField(14);
   
   private Panel regip1 = new Panel(new GridLayout(6,1,5,5));
   private Panel regip2 = new Panel(new GridLayout(6,1,5,5));
   private Panel regip3 = new Panel(new BorderLayout());
 
   private Panel regip4 = new Panel(new FlowLayout(FlowLayout.RIGHT));
   
   private Panel regip5 = new Panel(new BorderLayout(10,10));
   private Panel regip6 = new Panel(new FlowLayout());
   
   private Panel regip7 = new Panel (new GridLayout(6,1,5,5));
   
   private JLabel reglb= new JLabel(" 가입에 필요한 정보를 기입하여 주세요.");
   private JLabel rr1 = new JLabel("　");
   private JLabel tip1 = new JLabel("영문,숫자 조합 사용");
   private JLabel tip2 = new JLabel("Ex) \"홍길동\"");
   private JLabel tip3 = new JLabel("Ex)xx(년)xx(월)xx(일)");
   // 버튼 
   private JButton regb1 = new JButton("확인");
   private JButton regb2 = new JButton("취소");
   private JButton id_check = new JButton("중복 확인");
   private Graphics g;
   
   public void paintComponent(Graphics g) { // 배경 사용
	   super.paintComponents(g);
	   g.drawImage(image.getImage(), 0, 0, this.getSize().width, this.getSize().height,null);
	  icon = new ImageIcon("E:\\IDE\\IDE\\homepage\\img\\home_logo.jpg");
	  JPanel panel = new JPanel() {
		   public void paintComponent(Graphics g) {
		    g.drawImage(icon.getImage(), 0, 0, null);
		    setOpaque(false);
		    super.paintComponent(g);
		   }
	  };
	  scrollPane = new JScrollPane(panel);
	  setContentPane(scrollPane);
	  
	       }
	   
   
   public Exam01_sub(){
      super();

      this.init();
      this.start();
      this.setSize(1000, 700);
      this.setVisible(true);
      this.paintComponent(g);
	
   }


   private void init() {
	 
      con = this.getContentPane();
      con.setLayout(border);
      
      //맨위 이벤트 카트 호출 로그아웃 버튼들 패널에 추가
      main_north.add(event);
      event.setBorderPainted(false); //테두리 지우기
      event.setContentAreaFilled(false); //배경색투명
      event.setFocusPainted(false); //클릭시 테두리 지우기
      main_north.add(cart);
      cart.setBorderPainted(false);
      cart.setContentAreaFilled(false);
      cart.setFocusPainted(false);
      main_north.add(call);
      call.setBorderPainted(false);
      call.setContentAreaFilled(false);
      call.setFocusPainted(false);
      main_north.add(logout);
      logout.setBorderPainted(false);
      logout.setContentAreaFilled(false);
      logout.setFocusPainted(false);
      this.add("North",main_north);
      
      //왼쪽 메뉴 탭 버튼들 패널에 추가
      main_west.add(best); //
      best.setBorderPainted(false);
      best.setContentAreaFilled(false);
      best.setFocusPainted(false);
      main_west.add(pizza);
      pizza.setBorderPainted(false);
      pizza.setContentAreaFilled(false);
      pizza.setFocusPainted(false);
      main_west.add(pasta);
      pasta.setBorderPainted(false);
      pasta.setContentAreaFilled(false);
      pasta.setFocusPainted(false);
      main_west.add(steak);
      steak.setBorderPainted(false);
      steak.setContentAreaFilled(false);
      steak.setFocusPainted(false);
      main_west.add(dessert);
      dessert.setBorderPainted(false);
      dessert.setContentAreaFilled(false);
      dessert.setFocusPainted(false);
      main_west.add(drink);
      drink.setBorderPainted(false);
      drink.setContentAreaFilled(false);
      drink.setFocusPainted(false);
 
      main_west.paint(g);
      this.add("West", main_west);
      
      
      //정렬할 메뉴들 패널에 추가 (초기 고정화면은 추천메뉴라 우선 추천메뉴로 패널 구성)
      main_center.add(best1);
      main_center.add(best2);
      main_center.add(best3);
      this.add("Center", main_center);
      //main_center.setBackground(new Color(238,238,238)); //패널 백그라운드 컬러 지정
      main_center.setBorder(BorderFactory.createEmptyBorder(20,20,20,20)); //패널 공백 지정
   }

   private void start() {
      this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      best.addActionListener(this);
      pizza.addActionListener(this);
      pasta.addActionListener(this);
      steak.addActionListener(this);
      logout.addActionListener(this); /////
      Registdlg.addWindowListener(this);
      
   }


   @Override
   public void actionPerformed(ActionEvent e) {
      // TODO Auto-generated method stub
      if(e.getSource()==best){
         showBest();
      }
      else if(e.getSource()==pizza){
         showPizza();
      }
      else if(e.getSource()==pasta){
         showPasta();
      }
      else if(e.getSource()==steak){
         showSteak();
      }
      
      else if(e.getSource()==logout){ // 회원가입 넣음 
    	  showRegist();
      }
   }
   
   //추천메뉴 띄우는 함수
   public void showBest(){
      main_center.removeAll(); //main_center에 추가된것들 다 지우고
      main_center.repaint(); //새로 구성
      main_center.add(best1);
      main_center.add(best2);
      main_center.add(best3);
      this.add("Center", main_center);
      main_center.validate();
   }
  
   //피자메뉴 띄우는 함수
   public void showPizza(){
      main_center.removeAll();
      main_center.repaint();
      main_center.add(pizza1);
      pizza1.setBorderPainted(false);
      pizza1.setContentAreaFilled(false);
      pizza1.setFocusPainted(false);
      main_center.add(pizza2);
      pizza2.setBorderPainted(false);
      pizza2.setContentAreaFilled(false);
      pizza2.setFocusPainted(false);
      main_center.add(pizza3);
      pizza3.setBorderPainted(false);
      pizza3.setContentAreaFilled(false);
      pizza3.setFocusPainted(false);
      main_center.add(pizza4);
      pizza4.setBorderPainted(false);
      pizza4.setContentAreaFilled(false);
      pizza4.setFocusPainted(false);
      main_center.add(pizza5);
      pizza5.setBorderPainted(false);
      pizza5.setContentAreaFilled(false);
      pizza5.setFocusPainted(false);
      main_center.add(pizza6);
      pizza6.setBorderPainted(false);
      pizza6.setContentAreaFilled(false);
      pizza6.setFocusPainted(false);
      main_center.add(pizza7);
      pizza7.setBorderPainted(false);
      pizza7.setContentAreaFilled(false);
      pizza7.setFocusPainted(false);
      main_center.add(pizza8);
      pizza8.setBorderPainted(false);
      pizza8.setContentAreaFilled(false);
      pizza8.setFocusPainted(false);
      main_center.add(pizza9);
      pizza9.setBorderPainted(false);
      pizza9.setContentAreaFilled(false);
      pizza9.setFocusPainted(false);
      main_center.add(pizza10);
      pizza10.setBorderPainted(false);
      pizza10.setContentAreaFilled(false);
      pizza10.setFocusPainted(false);
      main_center.add(pizza11);
      this.add("Center", main_center);
      main_center.validate();
   }
   
   //파스타메뉴 띄우는 함수
   public void showPasta(){
      main_center.removeAll();
      main_center.repaint();
      main_center.add(pasta1);
      main_center.add(pasta2);
      main_center.add(pasta3);
      main_center.add(pasta4);
      main_center.add(pasta5);
      main_center.add(pasta6);
      this.add("Center", main_center);
      main_center.validate();
   }
   
   //스테이크메뉴 띄우는 함수
   public void showSteak(){
      main_center.removeAll();
      main_center.repaint();
      main_center.add(steak1);
      main_center.add(steak2);
      main_center.add(steak3);
      main_center.add(steak4);
      main_center.add(steak5);
      main_center.add(steak6);
      this.add("Center", main_center);
      main_center.validate();
   }
   
   // 회원 가입에 대한 함수
   public void showRegist(){
	   // 회원 가입 구성 
	   Registdlg.removeAll();
	   
	   regip1.add(reglb1);
	   regip1.add(reglb2);
	   regip1.add(reglb3);
	   regip1.add(reglb4);
	   regip1.add(reglb5);
	   regip1.add(reglb6);
	   
	   regip2.add(regtf1);
	   regip2.add(regtf2);
	   regip2.add(regtf3);
	   regip2.add(regtf4);
	   regip2.add(regtf5);
	   regip2.add(regtf6);
	   
	   regip3.add("West", regip1);
	   regip3.add("Center", regip2);
	   
	   regip4.add(regb1);
	   regip4.add(regb2);
	   
	   regip5.add("Center", reglb);
	   regip6.add(regip5);
	   regip7.add(id_check);
	   regip7.add(tip1);
	   regip7.add(tip2);
	   regip7.add(tip3);
	   
	   Registdlg.setVisible(true);
	   Registdlg.setLayout(new BorderLayout(10,10));
	   JPanel Registp = new JPanel(new BorderLayout(10,10));
	   Registp.add("West",regip1);
	   Registp.add("Center",regip2);
	   Registdlg.add("North",regip6);
	   Registdlg.add("Center",Registp);
	   Registdlg.add("South",regip4);
	   Registdlg.add("West", rr1);
	   Registdlg.add("East", regip7);
	   Registdlg.setSize(400, 350);
		
   }


public void windowActivated(WindowEvent e) {}

public void windowClosed(WindowEvent e) {}

public void windowClosing(WindowEvent e) {
	Registdlg.dispose();
}

public void windowDeactivated(WindowEvent e) {}

public void windowDeiconified(WindowEvent e) {}

public void windowIconified(WindowEvent e) {}

public void windowOpened(WindowEvent e) {}
}

