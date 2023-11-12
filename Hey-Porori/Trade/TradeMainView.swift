//
//  TradeMainView.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/16.
//

import SwiftUI

struct TradePostData: Identifiable, Hashable {
    var id: Int
    
    var userId: String
    var title: String
    var contents: String
    var recommend: String
    //    var category: String
    //    var createdAt: Date
    //    var updatedAt: Date
    //    var deletedAt: Date
    var state: String
    var imageURL: String
}

struct TradeMainView: View {
    @EnvironmentObject var userData: UserData
    @State var searchText = ""
    
    @State var isPresentTradeCreatePostView: Bool = false
    
    @State var gridData: [TradePostData] = []
    
    let columns = [
        GridItem(.flexible(), spacing: 25),
        GridItem(.flexible(), spacing: 25)
    ]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                // MARK: 헤더
                HStack {
                    Text("중고거래")
                        .defaultStyle_Bold(size: .size22).foregroundColor(.black)
                        .padding(.leading, 20)
                    Spacer()
                    Button {
                        // TODO: 채팅 화면 네비게이션
                    } label: {
                        Image(systemName: "bubble.left.and.bubble.right")
                            .font(Font(.size22))
                            .foregroundColor(.black)
                    }.padding(.trailing, 20)
                }.padding(.bottom, 13)
                
                // MARK: 검색, 카테고리
                HStack {
                    Button {
                        // 카테고리 설정
                    } label: {
                        Text("카테고리")
                            .foregroundColor(.white)
                            .defaultStyle_Bold(size: .size14)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 9.5)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.darkBlue)
                            }
                    }
                    DefaultSearchTextBox(placeholder: "검색", searchText: $searchText)
                }.padding(.horizontal, 15)
                
                Divider().padding(.top, 10)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(gridData, id: \.self) { data in
                            NavigationLink(value: data) {
                                VStack {
                                    Image(data.imageURL)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 160, height: 160)
                                        .background(Color.lightGray)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                    HStack {
                                        Image(systemName: "heart.fill")
                                            .font(Font(.size16))
                                            .foregroundColor(.pink)
                                        Text("\(data.recommend)")
                                            .foregroundColor(.pink)
                                            .defaultStyle_Bold(size: .size14)
                                        Spacer()
                                        Text("필동")
                                            .defaultGrayStyle_Bold(size: .size14)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 2)
                                            .background {
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(Color.dividerGray)
                                            }
                                    }
                                    Text("\(data.title)")
                                        .defaultStyle(size: .size16)
                                }.padding(.bottom, 20)
                            }
                        }
                    }.navigationDestination(for: TradePostData.self) { postItem in
                        TradePostDetailView(postData: postItem)
                    }
                }.padding(.horizontal, 25)
            } //VStack
            
            // MARK: 플로팅 버튼 - 글쓰기
            Button {
                isPresentTradeCreatePostView = true
            } label: {
                Image(systemName: "highlighter")
                    .font(Font(.size24))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.subSkyBlue)
                    .clipShape(Circle())
            }.padding().navigationDestination(isPresented: $isPresentTradeCreatePostView) {
                TradeCreatePostView(isPresentTradeCreatePostView: $isPresentTradeCreatePostView)
            }
        }.onAppear { //ZStack
//            gridData = Array(1...9).map { TradePostData(id: $0, userId: "jm10123@gmail.com", title: "닌텐도칩 팜 각 5.0", contents: "123", recommend: "13", state: "12") }
            gridData.append(TradePostData(id: 1, userId: "jm10123@gmail.com", title: "닌텐도칩 팝니다 네고가능 각 5.0", contents: "123", recommend: "13", state: "12", imageURL: "tradeIcon1"))
            gridData.append(TradePostData(id: 2, userId: "jm10123@gmail.com", title: "자전거 팔아용 17만 5천원", contents: "123", recommend: "5", state: "12", imageURL: "tradeIcon2"))
            gridData.append(TradePostData(id: 3, userId: "jm10123@gmail.com", title: "조립컴퓨터 125에 급처합니다 사양 글 확인", contents: "123", recommend: "7", state: "12", imageURL: "tradeIcon3"))
            gridData.append(TradePostData(id: 4, userId: "jm10123@gmail.com", title: "황올 + 콜라 깊티 1.7에 급처해요", contents: "123", recommend: "2", state: "12", imageURL: "tradeIcon4"))
            gridData.append(TradePostData(id: 5, userId: "jm10123@gmail.com", title: "아이패드 M1 프로 팝니다 네고가능 선제", contents: "123", recommend: "8", state: "12", imageURL: "tradeIcon5"))
        }
    }
}
