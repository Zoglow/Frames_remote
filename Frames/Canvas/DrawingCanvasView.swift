//
//  DrawingCanvasView.swift
//  Frames
//
//  Created by Zoe Sosa on 7/26/23.
//

import SwiftUI
import CoreData
import PencilKit

struct DrawingCanvasView : UIViewControllerRepresentable {
    @Environment(\.managedObjectContext) private var viewContext
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.drawingData = data
    }
    typealias UIViewControllerType = DrawingCanvasViewController
    
    var data: Data
    var id: UUID
    
    func makeUIViewController(context: Context) -> DrawingCanvasViewController {
        let viewController = DrawingCanvasViewController()
        viewController.drawingData = data
        viewController.drawingChanged = { data in
            let request: NSFetchRequest<Frame> = Frame.fetchRequest()
            let predicate = NSPredicate(format: "id == %@", id as CVarArg)
            request.predicate = predicate
            do {
                let result = try viewContext.fetch(request)
                let obj = result.first
                obj?.setValue(data, forKey: "canvasData")
                do {
                    try viewContext.save()
                } catch {
                    print(error)
                }
            }
            catch {
                print(error)
            }
        }
        
        return viewController
    }
    
}
