sub init ()
	m.top.functionName = "executeRequest"
end sub

sub executeRequest()
	urlTranfer = createObject("roUrlTransfer")
	urlTranfer.setUrl(m.top.URL)

	' allow for https
	urlTranfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
	urlTranfer.AddHeader("X-Roku-Reserved-Dev-Id", "")
	urlTranfer.InitClientCertificates()

	port = createObject("roMessagePort")
	urlTranfer.setPort(port)

	timeout = 10000
	jsonResultString = ""

	if urlTranfer.asyncGetToString()
		event = wait(timeout, urlTranfer.GetPort())
		if type(event) = "roUrlEvent"
			jsonResultString = event.GetString()
		else if event = invalid
			urlTranfer.AsyncCancel()
		end if
	end if

	if 0 < Len(jsonResultString)
		response = parseJSON(jsonResultString)
		if response <> invalid
			m.top.jsonResult = response
		end if
	else
		m.top.jsonResult = {}
	end if
end sub

