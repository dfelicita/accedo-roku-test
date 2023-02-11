sub init()
  m.spinner = m.top.FindNode("spinner")
  m.spinner.poster.uri="pkg:/images/loader.png"

	m.list = m.top.FindNode("movielist")
  m.detail = m.top.FindNode("details")

  m.top.observeField("genderSelected", "onGenderSelect")
end sub

sub OnLoadGender()
  m.spinner.visible = "false"
  m.list.visible = "true"
  m.list.setFocus(true)
end sub

sub OnLoadMovie()
  m.spinner.visible = "false"
  m.detail.visible = "true"
  m.detail.getChild(1).setFocus(true)
end sub

sub onGenderSelect()
  m.detail.detailTitle = m.top.genderSelectedTitle
  m.detail.genreid = m.top.genderSelected
  m.list.visible = "false"
  m.spinner.visible = "true"
end sub

Function OnKeyEvent(key, press) as Boolean
    result = false
    if press then
        if key = "back"
            if m.list.visible = false and m.detail.visible = true
              m.detail.visible = false
              m.list.visible = true
              m.top.getChild(1).getChild(1).setFocus(true)
              result = true
            else
              result = false
            end if
        end if
    end if
    return result
End Function