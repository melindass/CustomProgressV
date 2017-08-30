//
//  ProgressV.swift
//  CustomProgressV
//
//  Created by ivna.evecom on 2017/7/26.
//  Copyright © 2017年 ivna. All rights reserved.
//

import UIKit

let margin:CGFloat = 10
class ProgressV: UIView {
    /// 未完成
    var lineUndoV:UIView?
    /// 已完成
    var lineDoneV:UIView?
    
    var undoArr:[UIView]!
    
    var dataArr:[String]?
    ///当前的索引
    var index:Int!{
        didSet{
            
            guard index! >=  0 && index! < (self.dataArr?.count)! else {
                return
            }
            //每个的宽度
            let per_W = self.frame.size.width / CGFloat ((self.dataArr?.count)!)
            //重新设置 完成视图的frame
            self.lineDoneV?.frame = CGRect.init(x: (lineUndoV?.frame.origin.x)!, y: (lineUndoV?.frame.origin.y)!, width: per_W * CGFloat (index!), height: (self.lineUndoV?.frame.size.height)!)
            let circleVx = self.undoArr[index!]
            ///设置标志位的位置
            markI?.center = CGPoint.init(x: circleVx.center.x, y: circleVx.center.y)
            markI?.text   = "\(index + 1)"
            addAnimation(sender: markI!)
            //设置 圆点的颜色
            for var i in 0 ..< self.undoArr.count{//重置颜色
                 let circleV = self.undoArr[i]
                if i <= index! {
                    
                    circleV.backgroundColor = UIColor.init(red: 35/255.0, green: 135/255.0, blue: 255/255.0, alpha: 1.0)
                }else{
                    
                    circleV.backgroundColor = UIColor.lightGray
                }
                
            }
        }
    }
    
    var markI:UILabel?
    
    
    init(frame:CGRect,dataArr:[String]) {
        
        super.init(frame: frame)
        index = 0
        self.dataArr = [String]()//初始化
        self.dataArr = dataArr
        self.backgroundColor = UIColor.green
        lineUndoV = UIView.init()
        let line_W = frame.size.width - frame.size.width / CGFloat (dataArr.count)
        lineUndoV?.frame  =  CGRect.init(x: 0, y: 0, width: line_W, height: 3)
        lineUndoV?.center = CGPoint.init(x: self.center.x, y: self.frame.size.height / 2)
        lineUndoV?.backgroundColor = UIColor.lightGray
        self.addSubview(lineUndoV!)
        
        let start_X = lineUndoV?.frame.origin.x
        let Per_W = self.frame.size.width / CGFloat (dataArr.count)
        self.undoArr = [UIView]()
        for var i in 0 ..< dataArr.count{
            
            // (13 - 1.5 ) / 2 因为是 中心点  所以  center_y = 3/2 = 1.5  往上移 5.75位
            let circleV = UIView.init(frame: CGRect.init(x: start_X! + Per_W * CGFloat(i) , y: (lineUndoV?.center.y)! -  5.75, width: 13, height: 13))
            circleV.backgroundColor = UIColor.lightGray
            circleV.layer.cornerRadius = 13 / 2
            self.addSubview(circleV)
            self.undoArr.append(circleV)
            
        }
        
        //创建标志位。。
        markI = UILabel.init(frame: CGRect.init(x: start_X! , y: (lineUndoV?.center.y)! - 11.75, width: 25, height: 25))
        markI?.backgroundColor = UIColor.init(red: 35/255.0, green: 135/255.0, blue: 255/255.0, alpha: 1.0)
        markI?.text = "1"
        markI?.textAlignment = .center
        markI?.textColor = UIColor.white
        markI?.layer.cornerRadius = 25 / 2
        markI?.layer.masksToBounds = true
        
        self.addSubview(markI!)

        lineDoneV = UIView.init()
        lineDoneV?.frame = CGRect.zero
        lineDoneV?.backgroundColor = UIColor.init(red: 35/255.0, green: 135/255.0, blue: 255/255.0, alpha: 1.0)
        
        self.addSubview(lineDoneV!)
        
        
      
    }
    
    func addAnimation(sender:UILabel)  {
        
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 1.5
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = 1
        scaleAnimate.duration = 0.5
        sender.layer.add(scaleAnimate, forKey: nil)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
