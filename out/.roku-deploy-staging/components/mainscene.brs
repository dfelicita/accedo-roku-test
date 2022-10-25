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
  m.detail.setFocus(true)
end sub

sub onGenderSelect()
  m.detail.genreid = m.top.genderSelected
  m.detail.genreTitle = m.top.genderSelectedTitle
  m.list.visible = "false"
  m.spinner.visible = "true"
end sub

Function OnKeyEvent(key, press) as Boolean
    result = false
    if press then
        if key = "back"
            if m.list.visible = false and m.detail.visible = true
              m.detail.visible = "false"
              m.detail.setFocus(false)  
              m.list.visible = "true"
              m.list.setFocus(true)
              result = true
            end if
        end if
    end if
    return result
End Function