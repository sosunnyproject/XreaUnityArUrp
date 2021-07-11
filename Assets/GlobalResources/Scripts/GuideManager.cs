using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GuideManager : MonoBehaviour
{
    public GameObject mapImage;
    public GameObject scene2;
    public GameObject scene3;
    public GameObject scene4;
    public GameObject scene5;
    public GameObject scene6;
    public GameObject imgDownload;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void NextButtonClicked()
    {
        if(mapImage.activeSelf)
        {
            scene2.SetActive(true);
            mapImage.SetActive(false);
        }
        else if(scene2.activeSelf)
        {
            scene3.SetActive(true);
            scene2.SetActive(false);
        }
        else if (scene3.activeSelf)
        {
            scene4.SetActive(true);
            scene3.SetActive(false);
        }
        else if (scene4.activeSelf)
        {
            scene5.SetActive(true);
            scene4.SetActive(false);
        }
        else if (scene5.activeSelf)
        {
            scene6.SetActive(true);
            scene5.SetActive(false);
        }
        else if (scene6.activeSelf)
        {
            imgDownload.SetActive(true);
            scene6.SetActive(false);
        }

        else if (imgDownload.activeSelf)
        {
            mapImage.SetActive(true);
            imgDownload.SetActive(false);
        }
    }

    // Update is called once per frame

}
