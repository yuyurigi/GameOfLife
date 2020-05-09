class  GOL {
  
  int w = 3;
  int columns, rows;
  
  // Game of life board
  int[][] board;
  
  GOL() {
    // initialize rows, columns and set-up arrays
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];
    img2 = loadImage("2.gif");
    
    init();
  }
  
  void init() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++){
        int pos = ((j*w)*width) + i*w;
        color c = img2.pixels[pos];
        if(c == color(255)){
          board[i][j] = 2;
        } else {
        board[i][j] = int(random(2));
        }
      }
      }
  }
  
  //The process of creating the new generation
  void generate() {
    
    int[][] next = new int[columns][rows];
    
    // Loop through every spot in our 2D array and check spots neighbors
    for (int x = 1; x < columns-1; x++) {
      for (int y = 1; y < rows-1; y++) {
        
        //Add up all the states in a 3x3 surrounding grid
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[x+i][y+j];
          }
        }
        
        // A little trick to subtract the current cell's state since
        // we added it in the above loop
        neighbors -= board[x][y];
        
        // Rules of Life
        if ((board[x][y] == 1) && (neighbors < 2)) next[x][y] = 0; // Loneliness
        else if ((board[x][y] == 1) && (neighbors > 3)) next[x][y] = 0; //Overpopulation
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1; //Reproduction
        else next[x][y] = board[x][y]; //Stasis
      }
    }
    
    // Next is now our board
    board = next;
  }
  
  // This is the easy part, just draw the cells, fill white for '1', fill black for  '0'
  void display() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        if (board[i][j] == 1) {
          fill(255);
          noStroke();
          rect(i*w, j*w, w, w);
        } else if(board[i][j] == 0) {
          fill(23, 43, 65);
        noStroke();
        rect(i*w, j*w, w, w);
        }
      }
    }
  }
}
