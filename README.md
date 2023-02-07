# iOS-Component-List

这是一个iOS第三方小组件仓库，例如 ActiveLabel、BonMot轻量级框架的使用.....

## ActiveLabel

### API

| 属性 | 作用 |
| :-: | :-: |
| mentionColor | @后面的文字默认颜色 |
| mentionSelectedColor | @后面的文字选中颜色 |
| hashtagColor | #后面的文字的默认颜色 |
| URLColor | 链接默认颜色 |
| URLSelectedColor | 链接选中颜色 |
| customColor | 自定义颜色 |
| lineSpacing | 文字间距 |
| handleMentionTap: (String) -> () | @后面的文字点击方法 |
| handleHashtagTap: (String) -> () | #后面的文字被点击的方法 |
| handleURLTap: (NSURL) -> () | 链接被点击的方法 |
| handleEmailTap: (String) -> () | 邮箱被点击的方法 |
| handleCustomTap(for type: ActiveType, handler: (String) -> ()) | 自定义类型点击方法 |
| filterHashtag: (String) -> Bool | 过滤掉指定的hash标签，使其不生效 |
| filterMention: (String) -> Bool | 过滤掉指定的@部分的文字，使其不生效 |

``` swift

label.handleMentionTap { userHandle in print("\(userHandle) tapped") }
label.handleHashtagTap { hashtag in print("\(hashtag) tapped") }
label.handleURLTap { url in UIApplication.shared.openURL(url) }
label.handleEmailTap { email in print("\(email) tapped") }
label.handleCustomTap(for: customType) { element in print("\(element) tapped") }
label.filterHashtag { hashtag in validHashtags.contains(hashtag) }
label.filterMention { mention in validMentions.contains(mention) }

```

