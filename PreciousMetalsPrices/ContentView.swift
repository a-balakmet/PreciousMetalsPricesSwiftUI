import SwiftUI

struct ContentView: View {
    
    @State private var month = getMonth(value: getCurrentPeriod()[1])
    @State private var metalColor = [Color("AccentColor"), Color("PrimaryColor"), Color("PrimaryColor"), Color("PrimaryColor")]
    @State private var currencyColor = [Color("AccentColor"), Color("PrimaryColor"), Color("PrimaryColor")]
    @State private var currencyName = "USD"
    
    @EnvironmentObject var appObservables: AppObservables
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color("BackgroundColor"))
            VStack {
                HStack {
                    Button(action: {
                        appObservables.month = getCurrentPeriod()[1]
                        appObservables.year = getCurrentPeriod()[0]
                        appObservables.isLoading = true
                    }, label: {
                        Image(systemName: "arrow.triangle.2.circlepath.circle")
                            .padding(.leading, 10)
                            .font(.largeTitle)
                    })
                    Spacer()
                    Text(LocalizedStringKey(appObservables.metalName)).font(.largeTitle)
                    Spacer()
                    ZStack {
                        VStack{
                            Text(getMonth(value: appObservables.month))
                            Text(String(appObservables.year))
                        }
                        Button("    ") {
                            appObservables.isDateChoice.toggle()
                        }.font(.system(size: 25))

                    }.padding(.trailing, 10)
                }.foregroundColor(Color("PrimaryColor"))
                Spacer()
                HStack {
                    Button(action: {
                        currencyColor = [Color("AccentColor"), Color("PrimaryColor"), Color("PrimaryColor")]
                        currencyName = "USD"
                    }, label: {
                        Text("USD").foregroundColor(currencyColor[0])
                    })
                    Spacer()
                    Button(action: {currencyColor = [Color("PrimaryColor"), Color("AccentColor"), Color("PrimaryColor")]
                        currencyName = "EUR"
                    }, label: {
                        Text("EUR").foregroundColor(currencyColor[1])
                    })
                    Spacer()
                    Button(action: {currencyColor = [Color("PrimaryColor"), Color("PrimaryColor"), Color("AccentColor")]
                        currencyName = "GBP"
                    }, label: {
                        Text("GBP").foregroundColor(currencyColor[2])
                    })
                }.padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                DataList(metalList: appObservables.metalList, silverList: appObservables.silverList, currencyName: currencyName)
                HStack {
                    Button(action: {
                        metalColor = [Color("AccentColor"), Color("PrimaryColor"), Color("PrimaryColor"), Color("PrimaryColor")]
                        appObservables.metalName = "gold"
                        appObservables.isLoading = true
                    }, label: {
                        Text("Au").font(.title).foregroundColor(metalColor[0])
                    })
                    Spacer()
                    Button(action: {
                        metalColor = [Color("PrimaryColor"), Color("AccentColor"), Color("PrimaryColor"), Color("PrimaryColor")]
                        appObservables.metalName = "silver"
                        appObservables.isLoading = true
                    }, label: {
                        Text("Ag").font(.title).foregroundColor(metalColor[1])
                    })
                    Spacer()
                    Button(action: {
                        metalColor = [Color("PrimaryColor"), Color("PrimaryColor"), Color("AccentColor"), Color("PrimaryColor")]
                        appObservables.metalName = "platinum"
                        appObservables.isLoading = true
                    }, label: {
                        Text("Pl").font(.title).foregroundColor(metalColor[2])
                    })
                    Spacer()
                    Button(action: {
                        metalColor = [Color("PrimaryColor"), Color("PrimaryColor"), Color("PrimaryColor"), Color("AccentColor")]
                        appObservables.metalName = "palladium"
                        appObservables.isLoading = true
                    }, label: {
                        Text("Pt").font(.title).foregroundColor(metalColor[3])
                    })
                    .onAppear(perform: {
                        appObservables.isLoading = true
                    })
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .font(.title)
            }
            VStack{
                Spacer()
                DatePickerDialog().offset(y: appObservables.isDateChoice ? 0 : UIScreen.main.bounds.height)
            }.background((appObservables.isDateChoice ? Color.black.opacity(0.3) : Color.clear).onTapGesture {
                appObservables.isDateChoice.toggle()
            }).edgesIgnoringSafeArea(.bottom)
            ZStack{
                Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
                if appObservables.isNetwork {
                    LoadingWindow()
                } else {
                    NoNetWindow()
                }
            }
            .opacity(appObservables.isLoading ? 1 : 0)
        }.animation(.default)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppObservables())
    }
}
