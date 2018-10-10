%n_names és Guser
%{
A=[];
for i=1:595
   for j=1:231
       if(string(Guser.Nodes.Name(i))==string(n_names(j)))
          A = [A ; string(n_names(j))];
       end
   end
end



B=string(table2cell(Guser.Nodes));
logicalVar = contains(B,A);
torlendo={};
for j=1:595
    if(logicalVar(j)==0)
        torlendo = [torlendo; Guser.Nodes.Name(j)];
    end
    
end
%}


for i=1:35
    
    z=553;
     
    Guser = rmnode(Guser,z);
end
for i=1:3
    
    z=547;
     
    Guser = rmnode(Guser,z);
end
for i=1:27
    
    z=511;
     
    Guser = rmnode(Guser,z);
end
for i=1:143
    
    z=272;
     
    Guser = rmnode(Guser,z);
end
for i=1:3
    
    z=264;
     
    Guser = rmnode(Guser,z);
end
for i=1:60
    
    z=191;
     
    Guser = rmnode(Guser,z);
end
for i=1:12
    
    z=140;
     
    Guser = rmnode(Guser,z);
end
for i=1:4
    
    z=128;
     
    Guser = rmnode(Guser,z);
end
for i=1:8
    
    z=110;
     
    Guser = rmnode(Guser,z);
end
for i=1:45
    
    z=50;
     
    Guser = rmnode(Guser,z);
end
for i=1:16
    
    z=26;
     
    Guser = rmnode(Guser,z);
end
for i=1:8
    
    z=9;
     
    Guser = rmnode(Guser,z);
end

Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','xLeQfa6h2JbDzsurRzfGJg',1);
Guser=addedge(Guser,'DDF6lbrU8TJRS4BtsKkdAw','xLeQfa6h2JbDzsurRzfGJg',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','gGdg9LOh61iUX1ui6suS0w',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','9jowTg7EZ0fx3lD_myUEug',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','zjblln7gfihMfPhgYXYrPA',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','abxwXqUEmPJMmAj18yRyXg',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','KSFxCcsYmSXpQBq3fbvfxQ',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','oCQZn1xwx1488NA-HZ52QA',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','7D1aiGp4rD2F1nTf5gc_Fw',1);
Guser=addedge(Guser,'kGxQxI2bcoCaITkSoHmDGg','yocUoAflwaRsnyUf6ceQwA',1);
Guser=addedge(Guser,'DDF6lbrU8TJRS4BtsKkdAw','gGdg9LOh61iUX1ui6suS0w',1);
Guser=addedge(Guser,'DDF6lbrU8TJRS4BtsKkdAw','KSFxCcsYmSXpQBq3fbvfxQ',1);
Guser=addedge(Guser,'DDF6lbrU8TJRS4BtsKkdAw','oCQZn1xwx1488NA-HZ52QA',1);
Guser=addedge(Guser,'DDF6lbrU8TJRS4BtsKkdAw','yocUoAflwaRsnyUf6ceQwA',1);
Guser = rmnode(Guser,'9E4RUSDnK5SXHafyy3zEcQ');
Guser = rmnode(Guser,'2wnXQhYr8dXPtMIMgb82tQ');
%{
while(1)
    logicalVar=a;
    Guser=temp;
    i=1;
    while(1)
        meret=size(Guser.Nodes.Name);
        meret2=size(logicalVar);
        if(meret(1)==231 || meret2(1)<i)
            break;
        end
        r = randi([0 1]);
        if(logicalVar(i)==0 && r==1)
            logicalVar(i)=[];
            Guser = rmnode(Guser,i);
        end
        i=i+1;
    end
    meret=size(Guser.Nodes.Name);
    if(meret<240)
        break;
    end
end
%}