
// Create a Project to demonstrate Simple Food Ordering Project which will help to orderfoods 

#include <iostream>
#include <array>
using namespace std;
class Pizza{
    public:
    int p_ch;
    int price;
    string pizza[5] = {"Margrerita","Tandoori Panir Pizza","9 Chissy","Peri Peri Pizza","Burn To Hell Pizza"};
    int p_price[5] = {140,200,240,220,399};
    int len = sizeof(pizza)/sizeof(pizza[0]);
    
    void show_pizza(){
        cout<<"\t\t\t--------------------- Pizza --------------------\n"<<endl;
        for(int i = 0;i<len;i++){
            cout<<i+1<<") "<<pizza[i]<<" - "<<p_price[i]<<endl;
        }
        cout<<endl<<endl;
    }
    void choose_pizza(){
        cout<<"Please Enter Which Pizza You Would Like To Have?: ";
        cin>>p_ch;
       
    }
};
class Burgers{
    public:
    int b_ch;
    int price;
    string burgers[4] = {"Crispy Chicken Burger","Crispy Veggie Burger","Aloo Tikki Burger","Panir Makhani Burger"};
    int b_price[4] = {229,189,100,120};
    int len = sizeof(burgers)/sizeof(burgers[0]);
    
    void show_burgers(){
        cout<<"\t\t\t-------------------- Burgers -------------------\n"<<endl;
        for(int i = 0;i<len;i++){
            cout<<i+1<<") "<<burgers[i]<<" - "<<b_price[i]<<endl;
        }
        cout<<endl<<endl;
    }
    void choose_burger(){
        cout<<"Please Enter Which Burger You Would Like To Have?: ";
        cin>>b_ch;
    }
};
class Rolls{
    public:
    int r_ch;
    int price;
    string rolls[4] = {"Potato Roll","Veg Manchuriyan Roll","Paneer Roll","Special Veg Roll"};
    int r_price[4] = {69,139,149,229};
    int len = sizeof(rolls)/sizeof(rolls[0]);
    
    void show_rolls(){
        cout<<"\t\t\t--------------------- Rolls --------------------\n"<<endl;
        for(int i = 0;i<len;i++){
            cout<<i+1<<") "<<rolls[i]<<" - "<<r_price[i]<<endl;
        }
        cout<<endl<<endl;
    }
    void choose_rolls(){
            cout<<"Please Enter Which Rolls You Would Like To Have?: ";
            cin>>r_ch;

    }
};
class Sandwich{
    public:
    int s_ch;
    int price;
    string sandwich[5] = {"Cheese Mayo","Shahi Paneer","Junglee Club","Veg. Crispy Sandwich","Extream veg Sandwich"};
    int s_price[5] = {80,90,240,160,100};
    int len = sizeof(sandwich)/sizeof(sandwich[0]);
    
    void show_sandwich(){
        cout<<"\t\t\t--------------------- Sandwich --------------------\n"<<endl;
        for(int i = 0;i<len;i++){
            cout<<i+1<<") "<<sandwich[i]<<" - "<<s_price[i]<<endl;
        }
        cout<<endl<<endl;
    }
    void choose_sandwich(){
            cout<<"Please Enter Which Sandwich You Would Like To Have?: ";
            cin>>s_ch;
    }
};
class Biryani{
    public:
    int br_ch;
    int price;
    string biryani[4] = {"Mutton Biryani","Veg Biryani","Chicken Biryani","Paneer Biryani"};
    int br_price[4] = {300,120,150,160};
    int len = sizeof(biryani)/sizeof(biryani[0]);
    
    void show_biryani(){
        cout<<"\t\t\t--------------------- Biryani --------------------\n"<<endl;
        for(int i = 0;i<len;i++){
            cout<<i+1<<") "<<biryani[i]<<" - "<<br_price[i]<<endl;
        }
        cout<<endl<<endl;
    }
    void choose_biryani(){
            cout<<"Please Enter Which Biryani You Would Like To Have?: ";
            cin>>br_ch;
    }
    
};
class Menu :public Pizza,Burgers,Rolls,Sandwich,Biryani{
    public:
    int ch;
    int Qnty;
    string menu[5] = {"Pizza","Burgers","Sandwich","Rolls","Biryani"};
    int price;
    string item;
    int len = sizeof(menu)/sizeof(menu[0]);
    
    void show_menu(){
        cout<<"\t\t\t--------------------- Menu --------------------\n"<<endl;
        for(int i = 0;i<len;i++){
            cout<<i+1<<") "<<menu[i]<<endl;
        }
        cout<<endl<<endl;
    }
    void choice(){
        cout<<"Please Enter Your Choice:";
        cin>>ch;
        switch(ch){
            case 1:{
                show_pizza();
                choose_pizza();
                cout<<"Please Enter Quantity: ";
                cin>>Qnty;
                item = pizza[p_ch-1];
                price = Qnty * p_price[p_ch-1]; 
                break;
            }
            case 2:{
                show_burgers();
                choose_burger();
                cout<<"Please Enter Quantity: ";
                cin>>Qnty;
                item = burgers[b_ch-1];
                price = Qnty * b_price[b_ch-1]; 
                break;
            }
            case 3:{
                show_sandwich();
                choose_sandwich();
                cout<<"Please Enter Quantity: ";
                cin>>Qnty;
                item = sandwich[s_ch-1];
                price = Qnty * s_price[s_ch-1]; 
                break;
            }
            case 4:{
                show_rolls();
                choose_rolls();
                cout<<"Please Enter Quantity: ";
                cin>>Qnty;
                item = rolls[r_ch-1];
                price = Qnty * r_price[r_ch-1]; 
                break;
            }
            case 5:{
                show_biryani();
                choose_biryani();
                cout<<"Please Enter Quantity: ";
                cin>>Qnty;
                item = biryani[br_ch-1];
                price = Qnty * br_price[br_ch-1]; 
                break;
            }
        }
    }   
};
class User:public Menu{
    public:
    string name;
    char plus;
    int bill;
    User(){
        cout<<"\n\t\t\t-------------- Tops Tech. Fast Food --------------"<<endl;
        cout<<"Please Enter Your Name : ";
        cin>>name;
        cout<<"Hello "<<name<<". \nWelcome to Tops Tech. Fast Food"<<endl<<endl;
        cout<<"What Would You Like To Order?"<<endl<<endl;
        show_menu();
        choice();   
    }
    void display_order(){
        cout<<"\n\t\t\t------------------ Your Order -------------------"<<endl;
        cout<<Qnty<<" - "<<item<<endl;
        cout<<"Your Total Bill : "<<price<<endl;
        cout<<"Your Order Will Be Delivered In 40 Minutes.."<<endl;
        cout<<"Thanks For Ordering From Tops Tech. Fast Food"<<endl<<endl;
           
    }
    void order_more(){
        cout<<"Would You Like To Order Anything Else? Y / N :"; 
        cin>>plus;
        for(int i = 0;plus == 'y'||plus == 'Y';i++){
            show_menu();
            choice();
            display_order();
            order_more();
        }
    }

};
int main(){
    User usr;
    usr.display_order();
    usr.order_more();
    cout<<"\t\t\t-----------------Thank You!!-------------------";
}
