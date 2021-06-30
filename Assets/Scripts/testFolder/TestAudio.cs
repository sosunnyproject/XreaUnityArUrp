using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestAudio : MonoBehaviour
{
    public LightweightBookHelper lightweightBookHelper;

    public AudioClip[] AudioList;
    public AudioSource audioSource;

    private int PageIndex = 0;
    private int MaxPage = 3;
    // Start is called before the first frame update
    void Start()
    {
        MaxPage = AudioList.Length;
    }

    private void OnGUI()
    {
        if (GUI.Button(new Rect(0, 0, 100, 100), "Audio Button"))
        {
            if(audioSource.isPlaying)
            {
                Debug.Log("Audio Play");
                audioSource.Stop();
                audioSource.clip = null;
            }
            else
            {
                if (MaxPage > PageIndex)
                {
                    lightweightBookHelper.NextPage();
                    audioSource.clip = AudioList[PageIndex];
                    audioSource.Play();
                }
            }
        }
    }
}
