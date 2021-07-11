using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OpenUrlBtn : MonoBehaviour
{
    public string url = "";

    void Start()
    {
    }

    public void urlBtnClicked()
    {
        Application.OpenURL(url);
    }
}
