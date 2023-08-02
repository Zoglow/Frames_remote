//
//  ContentView.swift
//  Frames
//
//  Created by Zoe Sosa on 7/11/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Frame.entity(), sortDescriptors: []) var frames: FetchedResults<Frame>
    
    @State private var showSheet = false

    var body: some View {
        
        NavigationView {
            List {
                VStack {
                    ForEach(frames){frame in
                        NavigationLink(destination: DrawingView(id: frame.id, data: frame.canvasData, title: frame.title), label: {
                            Text(frame.title ?? "Untitled")
                        })
                        
                    }
                    
                    Button(action: {
                        self.showSheet.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Canvas")
                        }
                    })
                    .foregroundColor(.blue)
                    .sheet(isPresented: $showSheet, content: {
                        AddNewCanvasView().environment(\.managedObjectContext, viewContext)
                    })
                }
                .navigationTitle(Text("Frame"))
                .toolbar {
                    EditButton()
                }
                
        
            }
        
            VStack {
                Image(systemName: "scribble.variable")
                    .font(.largeTitle)
                Text("No canvas has been selected")
                    .font(.title)
                
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
