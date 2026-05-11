//
//  ViewController.swift
//  NSTextViewBugDemo
//
//  Created by Victor Teo on 2026/5/11.
//

import Cocoa

class ViewController: NSViewController {

    var textView: SyntaxHighlightTextView!

    var scrollView: NSScrollView!

    override func loadView() {
        super.loadView()
        scrollView = SyntaxHighlightTextView.scrollableTextView()
        textView = (scrollView.documentView as! SyntaxHighlightTextView)
        print("textView text layout manager \(textView.textLayoutManager)")
        textView.string = "{\n    \"a\": true\n}"
        textView.isEditable = true
        textView.allowsUndo = true
        textView.isVerticallyResizable = true
        view.addSubview(scrollView)
    }

    override func viewDidLayout() {
        super.viewDidLayout()
        scrollView.frame = view.bounds
    }
}

