//
//  DrawingView.swift
//  Frames
//
//  Created by Zoe Sosa on 8/1/23.
//

import SwiftUI

struct DrawingView: View {
   
    @Environment(\.managedObjectContext) var viewContext
    
    @State var id:UUID?
    @State var data:Data?
    @State var title:String?
    
    var body: some View {
        VStack {
            DrawingCanvasView(data: data ?? Data(), id: id ?? UUID())
                .environment(\.managedObjectContext, viewContext)
                .navigationTitle(title ?? "Untitled")
        }
    }
    
}
