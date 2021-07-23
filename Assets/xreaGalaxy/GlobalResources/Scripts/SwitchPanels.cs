using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
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
    }

    public void closeBtnClciked()
    {
        Debug.Log("Clicked close Btn");
        helpPanel.SetActive(false);
        infoPanel.SetActive(false);
    }

    public void qrBtnPressed()
    {
        Debug.Log("Pressed QR Btn");
        //focusPanel.SetActive(true);
    }
    public void qrBtnReleased()
    {
        Debug.Log("Released QR Btn");
        //focusPanel.SetActive(false);
    }

    // Update is called once per frame
}
