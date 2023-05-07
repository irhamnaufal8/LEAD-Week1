//
//  ContentView.swift
//  MentoringLEAD
//
//  Created by Irham Naufal on 07/05/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
  @Published var tabSelection: Int = 0
}

struct ContentView: View {
  let profileSection = [
    ProfileSection(image: .icPersonProfile, text: "Edit Profile"),
    ProfileSection(image: .icHeartProfile, text: "Kreator Pilihanmu"),
    ProfileSection(image: .icLockProfile, text: "Ubah Kata Sandi"),
    ProfileSection(image: .icHelpProfile, text: "Bantuan"),
    ProfileSection(image: .icPowerProfile, text: "Keluar")
  ]
  
  @ObservedObject var viewModel = ProfileViewModel()
  
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 28) {
          HStack(spacing: 24) {
            Image.imgDummyAvatarProfile
              .resizable()
              .scaledToFit()
              .frame(width: 58, height: 58)

            VStack(alignment: .leading, spacing: 8) {
              Text("Elon Musk")
                .font(.robotoBold(size: 20))
                .foregroundColor(.black1)

              Text("081234567891")
                .font(.robotoRegular(size: 14))
                .foregroundColor(.black2)
            }

            Spacer()
          }
          .padding(.bottom, 5)

          HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 6) {
              Text("Coin Kamu")
                .font(.robotoBold(size: 14))
                .foregroundColor(.black1)

              HStack(spacing: 4) {
                Image.icCoinProfile
                  .resizable()
                  .scaledToFit()
                  .frame(width: 25, height: 25)

                Text("120.000")
                  .font(.robotoBold(size: 20))
                  .foregroundColor(.primaryPurple)
              }
            }

            Spacer()

            Button {

            } label: {
              Image.icClockProfile
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding(8)
                .background(
                  Circle()
                    .foregroundColor(.primaryPurple)
                )
            }

            Button {

            } label: {
              Text("Tambah Coin")
                .font(.robotoBold(size: 10))
                .foregroundColor(.white)
                .padding(10)
                .background(
                  Color.primaryPurple
                )
                .cornerRadius(8)
            }

          }
          .padding()
          .background(Color.white)
          .cornerRadius(24)
          .shadow(color: .black.opacity(0.12), radius: 8, y: 2)

          Text("Pengaturan Akun")
            .font(.robotoBold(size: 14))
            .foregroundColor(.black1)

          ForEach(profileSection, id: \.text) { section in
            NavigationLink {
              Text(section.text)
            } label: {
              ProfileComponent(image: section.image, text: section.text)
            }
          }
        }
        .padding()
//      }
//    VStack {
//      Text("lalala")
//      TabView(selection: $viewModel.tabSelection, content: {
//        ZStack {
//          Color.red.ignoresSafeArea()
//          Text("haloo")
//        }
//        .tag(0)
//
//        ZStack {
//          Color.blue.ignoresSafeArea()
//          Text("haloo")
//        }
//        .tag(1)
//
//        ZStack {
//          Color.green.ignoresSafeArea()
//          Text("haloo")
//        }
//        .tag(2)
//      })
//      .tabViewStyle(.page(indexDisplayMode: .never))
          }
      .background(
        Color.lightPurple
          .ignoresSafeArea()
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct ProfileComponent: View {
  var image: Image
  var text: String
  
  var body: some View {
    VStack {
      HStack(spacing: 18) {
        image
          .resizable()
          .scaledToFit()
          .frame(width: 36, height: 36)
        
        Text(text)
          .font(.robotoRegular(size: 14))
          .foregroundColor(.black2)
        
        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .thin))
          .foregroundColor(.black1)
      }
      
      Divider()
    }
  }
}

struct ProfileSection {
  var image: Image
  var text: String
}
