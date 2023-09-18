//
//  LogInSheetView.swift
//  OnlyPickOne
//
//  Created by 한태희 on 2023/09/18.
//

import SwiftUI

struct LogInSheetView: View {
    @Binding var isShowingLogInSheet: Bool
    @State var emailInput = ""
    @State var passwordInput = ""
    @ObservedObject var viewModel = LogInViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("opoBackground")
                    .ignoresSafeArea(.all)
                VStack(spacing: 16) {
                    Spacer()
                    Image("opoImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                    Spacer()
                    NavigationLink {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 48) {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("이메일")
                                        .font(.headline)
                                    TextField("가입하신 이메일을 입력해주세요.", text: $emailInput)
                                        .textInputAutocapitalization(.never)
                                }
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("비밀번호")
                                        .font(.headline)
                                    SecureField("비밀번호를 입력해주세요.", text: $passwordInput)
                                }
                                Button {
                                    viewModel.logIn()
                                    isShowingLogInSheet = !(viewModel.isSucessLogIn)
                                } label: {
                                    Text("로그인")
                                        .frame(maxWidth: .infinity)
                                }
                                .padding(0)
                                .frame(height: 40)
                                .background(emailInput.count > 0 && passwordInput.count > 0 ? Color("opoBlue") : Color(cgColor: UIColor.systemGray5.cgColor))
                                .foregroundColor(emailInput.count > 0 && passwordInput.count > 0 ? .white : Color(cgColor: UIColor.systemGray2.cgColor))
                                .font(.headline)
                                .cornerRadius(10)
                                .disabled(!(emailInput.count > 0 && passwordInput.count > 0))
                            }
                            .padding(36)
                            .onAppear() {
                                viewModel.isSucessLogIn = false
                            }
                        }
                    } label: {
                        Text("로그인")
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .frame(height: 40)
                    .background(Color("opoBlue"))
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                    
                    NavigationLink {
                        SignUpView(isShowingLogInSheet: $isShowingLogInSheet)
                    } label: {
                        Text("회원가입")
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .frame(height: 40)
                    .background(Color("opoRed"))
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                }
                .padding(48)
            }
            .tint(Color("opoPink"))
        }
        
    }
}
