//
//  IrregularGrid.swift
//  IrregularGrid
//
//  Created by Matthias Zarzecki on 08.03.21.
//

import SwiftUI

struct IrregularGrid: View {
  var body: some View {
    let padding: CGFloat = 10
    let cellWidthSmall: CGFloat = 150
    let cellWidthLarge: CGFloat = cellWidthSmall * 2 + padding
    
    let column = GridItem(.fixed(cellWidthSmall), spacing: padding, alignment: .leading)
    let gridItems = [column, column]
    
    LazyVGrid(columns: gridItems, spacing: padding) {
      ForEach(0..<10) { index in
        let width: CGFloat = isBigCell(index)
          ? cellWidthLarge
          : cellWidthSmall
        
        Text("\(index)")
          .frame(width: width, height: 150)
          .background(Color.red)
          .cornerRadius(24)
          .shadow(radius: 6)
        
        if isBigCell(index) {
          // "Filler" cell to pad out the slot that
          // would be occupied in a regular grid.
          Color.clear
        }
      }
    }
    .frame(width: 330)
  }
  
  private func isBigCell(_ index: Int) -> Bool {
    return (index + 1) % 3 == 0
  }
}

struct IrregularGrid_Previews: PreviewProvider {
  static var previews: some View {
    IrregularGrid()
  }
}
