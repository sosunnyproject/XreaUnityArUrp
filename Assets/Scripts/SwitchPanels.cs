using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SwitchPanels : MonoBehaviour
{
    public GameObject helpPanel;
    public GameObject infoPanel;
    public GameObject focusPanel;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void helpBtnClicked()
    {
        Debug.Log("Clicked Help Btn");
        helpPanel.SetActive(true);
    }

    public void infoBtnClicked()
    {
        Debug.Log("Clicked info Btn");
        infoPanel.SetActive(true);
    }

    public void qrBtnClicked()
    {
        Debug.Log("Clicked QR Btn");
        if(focusPanel.active == true)
        {
            focusPanel.SetActive(false);
        }
        else if(focusPanel.active == false)
        {
            focusPanel.SetActive(true);
        }
    }

    public void closeBtnClciked()
    {
        Debug.Log("Clicked close Btn");
        helpPanel.SetActive(false);
        infoPanel.SetActive(false);
    }

    // Update is called once per frame
}
