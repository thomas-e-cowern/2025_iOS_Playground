//
//  MailView.swift
//  MailViewDemo
//
//  Created by Thomas Cowern on 4/22/25.
//
import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(recipients)
        if let subject = subject {
            vc.setSubject(subject)
        }
        if let body = body {
            vc.setMessageBody(body, isHTML: false)
        }
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        
    }
    
    static func canSendMail() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }
    
    typealias UIViewControllerType = MFMailComposeViewController
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    let recipients: [String]
    let subject: String?
    let body: String?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        var parent: MailView
        
        init(parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                parent.dismiss()
            }
            if let error = error {
                parent.result = .failure(error)
            } else {
                parent.result = .success(result)
            }
        }
    } // End of class
}

struct MailViewModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    
    let recipients: [String]
    let subject: String?
    let body: String?
    
    
    @State private var mailResult: Result<MFMailComposeResult, Error>? = nil
    @State private var alertMessage: String? = nil
    @State private var isAlertPresented: Bool = false
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                MailView(result: $mailResult, recipients: recipients, subject: subject, body: body)
            }
            .onDisappear {
                if let result = self.mailResult {
                    switch result {
                    case .success(let mailResult):
                        switch mailResult {
                        case .sent:
                            alertMessage = "Mail sent successfully."
                            isAlertPresented = true
                        case .saved:
                            alertMessage = "Mail saved as draft."
                            isAlertPresented = true
                        case .cancelled:
                            alertMessage = "Mail cancelled."
                            isAlertPresented = true
                        case .failed:
                            alertMessage = "Mail failed to send."
                            @unknown default:
                            alertMessage = "Unknown Error."
                            isAlertPresented = true
                        }
                    case .failure(let error):
                        alertMessage = error.localizedDescription
                        isAlertPresented = true
                    } // End of result
                }
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(title: Text("Mail"), message: Text(alertMessage ?? "Uknown Error"), dismissButton: .default(Text("Ok")))
            }
    }
}

extension View {
    func mailView(_ isPresented: Binding<Bool>, recipients: [String], subject: String? = nil, body: String? = nil) -> some View {
        modifier(MailViewModifier(isPresented: isPresented, recipients: recipients, subject: subject, body: body))
    }
}
