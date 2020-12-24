//
//  ContentView.swift
//  anikaku
//
//  Created by 納本穂高 on 2020/12/17.
//

import SwiftUI

struct Anime {
    var title: String
    
    var maxims: [String]
}

struct ContentView: View {
    var animes: [Anime] = [
        Anime(
            title: "やはり俺の青春はまちがっている",
            maxims: [
                "青春とは嘘であり、悪である。",
                "みんなでやることが素晴らしくて、みんなでやることがいいことで、じゃあ、一人でやることは悪いことなのか？　どうして、今まで一人でも頑張ってきていた人間が否定されなきゃいけないんだ。",
            ]
        )
    ]

    @State var title = "test"
    @State var maxim = "test"
    
    func pickAnime() {
        let anime = animes.randomElement()!;
        title = anime.title;
        maxim = anime.maxims.randomElement()!;
    }
    
    var body: some View {
        ZStack {
            Color(red: 1, green: 0.9, blue: 0.9).edgesIgnoringSafeArea(.all)

            VStack (spacing: 32.0) {
                Image("アニメ格言")
                    .resizable()
                    .frame(width: 97.6 * 3, height: 70.2 * 3, alignment: .leading)
                    .padding()
                Text(title)
                    .font(.custom("g_brushtappitsu_freeR", size: 15))
                    .frame(width: 320, height: 50)
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(
                                Color(red: 255, green: 0.5, blue: 0.5)
                            )
                    )
                
                Text(maxim)
                    .lineLimit(nil)
                    .frame(width: 280, height: 100, alignment: .topLeading)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 255, green: 0.5, blue: 0.5), lineWidth: 4)
                    )
                
                HStack (spacing: 32.0) {
                    Button(action: { pickAnime() }) {
                        Text("生成")
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .foregroundColor(Color.white)
                    }
                        .frame(width: 130.0)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                Color(red: 1.0, green: 0.5, blue: 0.5)
                            )
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                Color(red: 1.0, green: 0.7, blue: 0.7),
                                lineWidth: 8
                            )
                    )
                    Button(action: {}) {
                        Text("ツイート")
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .foregroundColor(Color.white)
                    }
                        .frame(width: 130.0)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                Color(red: 0.5, green: 0.7, blue: 1)
                            )
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                Color(red: 0.7, green: 0.8, blue: 1),
                                lineWidth: 8
                            )
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
