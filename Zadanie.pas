type
  stackElement = record 
    data: integer; 
  end;

type
  stack = record 
    s: array of stackElement; 
    top: integer; 
  end;

procedure push(var s: stack; value: integer);
var
  a: stackElement;
begin
  a.data := value; 
  SetLength(s.s, s.top + 1); 
  s.s[s.top] := a; 
  s.top := s.top + 1; 
end;

function pop(var s: stack): integer;
begin
  if (s.top > 0) then 
  begin
    s.top := s.top - 1; 
    result := s.s[s.top].data; 
    SetLength(s.s, s.top); 
  end; 
end;

var
  st: stack; 
  f, g: text; 
  x: integer;

begin
  st.top := 0; 
  println('Введите имя файла:'); 
  var filename:=ReadlnString(); 
  Assign(f, filename); 
  reset(f); 
  while not Eof(f) do 
  begin
    read(f, x); 
    push(st, x); 
  end; 
  Close(f); 
  
  println('Введите имя нового файла:'); 
  var newfilename:=ReadlnString(); 
  Assign(g, newfilename); 
  rewrite(g); 
  
  for var i := 1 to st.top do 
  begin
    x := pop(st); 
    print(g, x, ' '); 
  end; 
  
  Close(g); 
end.