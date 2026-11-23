/-\!
# ArticleSubNumberLabelsSpec — 独立形式仕様

pinned 原文（第X条のY ラベル）から独立に読み取った仕様。実装を import しない。

構造ラベルは先頭 第・末尾 漢数字・中間 条 と の を含む。内容の規範は NOT MODELLED。
-/
namespace JapanTaxLaw.ArticleSubNumberLabelsSpec

def isSubLabelSpec (s : String) : Bool :=
  let cs := s.toList
  match cs.head?, cs.getLast? with
  | some h, some t =>
      h == '第' &&
      (t == '一' || t == '二' || t == '三' || t == '四' || t == '五' ||
       t == '六' || t == '七' || t == '八' || t == '九' || t == '〇' || t == '十' || t == '百' || t == '千') &&
      cs.contains '条' && cs.contains 'の'
  | _, _ => false

end JapanTaxLaw.ArticleSubNumberLabelsSpec
